#!/usr/bin/python3
import datetime
import re
import xml.etree.ElementTree as ett
from os.path import dirname as dn
from os.path import join as pj

import defusedxml.ElementTree as et
import pytz
import toml


class ViewGenerator:
    def __init__(self):
        self.conf_toml = pj(dn(__file__), "conf.toml")
        self.domain_xml = pj(dn(__file__), "../xml/data/catalogs.xml")
        self.output_dir = pj(dn(__file__), "../tmp")
        self.outfile = pj(self.output_dir, "views.xml")
        self.conf = self.read_conf_toml()
        self.xml = self.read_xml_file()
        self.generator = self.make_generator()
        self.lang_list = ["en", "de", "fr", "it"]
        self.view_uri_prefix = "https://ddp-bildung.org/views"

    def find_ddp_uri(self, s, gr=0):
        return self.rxfind("https://ddp-bildung.org.*?(?=')", s, gr)

    def fetch_output_string(self, render_obj, condition=None):
        constart = ""
        conend = ""
        if condition is not None:
            constart = "{%if val.value == '" + condition + "'%}"
            conend = "{%endif%}"
        s = (
            " {% get_value '"
            + render_obj["handle"]
            + "' as val%}"
            + constart
            + "Frage "
            + render_obj["handle"]
            + "{{val.value}}"
            + "<br>"
            + conend
        )
        return s

    def now(self):
        now = datetime.datetime.now()
        timezone = pytz.timezone("Europe/Berlin")
        local_now = timezone.localize(now)
        return local_now.strftime("%Y-%m-%dT%H:%M:%S.%f%z")

    def make_generator(self):
        gen = []
        for question in self.xml.iterfind("question"):
            uri = self.find_ddp_uri(question.find("attribute").items())
            option = None

            op = question.find("optionsets").find("optionset")
            if op is not None:
                option = self.find_ddp_uri(op.items())

            is_collection = self.to_bool(question.find("is_collection").text)
            ro = self.new_render_obj(uri, option, is_collection)
            gen.append(ro)
            gen = sorted(gen, key=lambda el: el["handle"])
        return gen

    def new_render_obj(self, uri, option, is_collection):
        obj = {
            "uri": uri,
            "option": self.rxfind("terms/options/(.*)", option, 1),
            "is_collection": is_collection,
            "handle": self.rxfind("terms/domain/(.*)", uri, 1),
            "module": self.rxfind("terms/domain/(.*?)(?=/)", uri, 1),
        }
        obj["output"] = self.fetch_output_string(obj, "berücksichtigt")
        return obj

    def read_conf_toml(self):
        with open(self.conf_toml) as filedata:
            data = filedata.read()
            d = toml.loads(data)
            return d

    def read_xml_file(self):
        try:
            return et.parse(self.domain_xml).getroot()
        except Exception as e:
            print("Xml parsing error: " + str(e))

    def rxfind(self, rx, s, gr=0):
        match = re.search(rx, str(s))
        if bool(match) is True:
            return match.group(gr)
        else:
            return None

    def to_bool(self, s):
        if str(s).lower() == "true":
            return True
        return False

    def write_array_to_file(self, data, filename, mode="w"):
        with open(filename, mode) as fp:
            for line in data:
                fp.write(line + "\n")

    def fetch_all_output_strings(self, generator):
        arr = []
        for el in generator:
            arr.append(el["output"])
        return arr

    def make_rdmo_xml_root(self):
        root = ett.Element("rdmo")
        root.set("xmlns:dc", "http://purl.org/dc/elements/1.1/")
        root.set("created", self.now())
        return root

    def make_view_xml(self, view, outstrings):
        print("Make xml entry for view: " + view["title_de"])
        xml = ett.Element("view")
        xml.set("dc:uri", self.view_uri_prefix + "/" + view["key"])
        u = ett.Element("uri_prefix")
        u.text = self.view_uri_prefix
        xml.append(u)
        k = ett.Element("key")
        k.text = view["key"]
        xml.append(k)
        xml.append(ett.Element("dc:comment"))
        for lang in self.lang_list:
            t = ett.Element("title")
            t.set("lang", lang)
            if lang == "de":
                t.text = view["title_de"]
            xml.append(t)
            h = ett.Element("help")
            h.set("lang", lang)
            if lang == "de":
                h.text = view["help_de"]
            xml.append(h)
        xml.append(ett.Element("catalogs"))
        t = ett.Element("template")
        t.text = self.conf["template"]["prefix"]
        t.text += "".join(outstrings)
        xml.append(t)
        return xml

    def generate(self):
        outstrings = self.fetch_all_output_strings(self.generator)
        root = self.make_rdmo_xml_root()
        for vt in self.conf["views"]:
            root.append(self.make_view_xml(self.conf["views"][vt], outstrings))

        tree = ett.ElementTree(root)
        with open(self.outfile, "wb") as files:
            tree.write(self.outfile)


vg = ViewGenerator()
vg.generate()
