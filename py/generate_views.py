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

    # preparation, generator creation
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
            ro = self.new_generator_entry(uri, option, is_collection, question_text)
            gen.append(ro)
            gen = sorted(gen, key=lambda el: el["handle"])
        return gen

    def new_generator_entry(self, uri, option, is_collection, question_text):
        obj = {
            "uri": uri,
            "option": rxfind("terms/options/(.*)", option, 1),
            "is_collection": is_collection,
            "handle": rxfind("terms/domain/(.*)", uri, 1),
            "module": rxfind("terms/domain/(.*?)(?=/)", uri, 1),
            "question_text": question_text,
        }
        # obj["output"] = self.fetch_output_string(obj, "berücksichtigt")
        return obj

    # create output string
    def getval(self, dict, key):
        try:
            return dict[key]
        except KeyError:
            return ""

    def make_output_string(self, view, generator_entry):
        s = (
            " {% get_value '"
            + generator_entry["handle"]
            + "' as val%}"
            + self.getval(view, "condition_start")
            + generator_entry["question_text"]
        )
        if self.getval(view, "display_answer") is True:
            s += "{{val.value}}<br><br>"
        s += self.getval(view, "condition_end")
        return s

    # ddp specific utils
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

    def save_view_xml(self, root):
        tree = ett.ElementTree(root)
        with open(self.outfile, "wb") as files:
            tree.write(self.outfile)

    # main public func generator
    def generate(self):
        root = self.make_rdmo_xml_root()
        for vt in self.conf["views"]:
            view = self.conf["views"][vt]
            outstrings = [markdown.markdown(self.conf["views"][vt]["header"])]
            for generator_entry in self.generator:
                if not generator_entry["handle"].startswith("basismodul"):
                    outstrings.append(self.make_output_string(view, generator_entry))
            root.append(self.make_view_xml(view, outstrings))
        self.save_view_xml(root)


if __name__ == "__main__":
    vg = ViewGenerator()
    vg.generate()
