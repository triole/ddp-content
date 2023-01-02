#!/usr/bin/python3
import xml.etree.ElementTree as ett
from os.path import dirname as dn
from os.path import join as pj

import markdown
from util import now, read_toml_file, read_xml_file, rxfind, to_bool


class ViewGenerator:
    def __init__(self):
        self.conf_toml = pj(dn(__file__), "conf.toml")
        self.xml_folder = pj(dn(__file__), "../xml/data")
        self.catalogs_xml = pj(self.xml_folder, "catalogs.xml")
        self.outfile = pj(self.xml_folder, "views.xml")
        self.conf = read_toml_file(self.conf_toml)
        self.xml = read_xml_file(self.catalogs_xml)
        self.generator = self.make_generator()
        self.lang_list = ["en", "de", "fr", "it"]
        self.view_uri_prefix = "https://ddp-bildung.org/views"

    def make_generator(self):
        gen = []
        for question in self.xml.iterfind("question"):
            uri = self.find_ddp_uri(question.find("attribute").items())
            option = None

            op = question.find("optionsets").find("optionset")
            if op is not None:
                option = self.find_ddp_uri(op.items())

            is_collection = to_bool(question.find("is_collection").text)
            question_text = markdown.markdown(question.find(".//text[@lang='de']").text)
            ro = self.new_render_obj(uri, option, is_collection, question_text)
            gen.append(ro)
            gen = sorted(gen, key=lambda el: el["handle"])
        return gen

    def new_render_obj(self, uri, option, is_collection, question_text):
        obj = {
            "uri": uri,
            "option": rxfind("terms/options/(.*)", option, 1),
            "is_collection": is_collection,
            "handle": rxfind("terms/domain/(.*)", uri, 1),
            "module": rxfind("terms/domain/(.*?)(?=/)", uri, 1),
            "question_text": question_text,
        }
        print(obj)
        obj["output"] = self.fetch_output_string(obj, "berücksichtigt")
        return obj

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
            + "<br>"
            + render_obj["question_text"]
            + "<br>"
            + "{{val.value}}"
            + "<br>"
            + conend
        )
        return s

    def find_ddp_uri(self, s, gr=0):
        return rxfind("https://ddp-bildung.org.*?(?=')", s, gr)

    # xml output related
    def make_rdmo_xml_root(self):
        root = ett.Element("rdmo")
        root.set("xmlns:dc", "http://purl.org/dc/elements/1.1/")
        root.set("created", now())
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

    def fetch_all_output_strings(self, generator):
        arr = []
        for el in generator:
            arr.append(el["output"])
        return arr

    # main public func generator
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
