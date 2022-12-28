#!/usr/bin/python3
import re
from os.path import dirname as dn
from os.path import join as pj

import defusedxml.ElementTree as ET
import toml


class ViewGenerator:
    def __init__(self):
        self.conf_toml = pj(dn(__file__), "conf.toml")
        self.domain_xml = pj(dn(__file__), "../xml/data/catalogs.xml")
        self.output_dir = pj(dn(__file__), "../tmp")
        self.conf = self.read_conf_toml()
        self.xml = self.read_xml_file()
        self.generator = self.make_generator()

    def find_ddp_uri(self, s, gr=0):
        return self.rxfind("https://ddp-bildung.org.*?(?=')", s, gr)

    def fetch_output_string(self, render_obj):
        s = (
            "Frage "
            + render_obj["handle"]
            + " {% render_value '"
            + render_obj["handle"]
            + "' %}<br>"
        )
        return s

    def make_generator(self):
        gen = {}
        for question in self.xml.iterfind("question"):
            uri = self.find_ddp_uri(question.find("attribute").items())
            option = None

            op = question.find("optionsets").find("optionset")
            if op is not None:
                option = self.find_ddp_uri(op.items())

            is_collection = self.to_bool(question.find("is_collection").text)
            ro = self.new_render_obj(uri, option, is_collection)
            try:
                gen[ro["module"]]
            except (AttributeError, KeyError):
                gen[ro["module"]] = [ro]
            else:
                if ro not in gen[ro["module"]]:
                    gen[ro["module"]].append(ro)
        for modname in gen:
            mod = gen[modname]
            gen[modname] = sorted(mod, key=lambda el: el["handle"])
        return gen

    def new_render_obj(self, uri, option, is_collection):
        obj = {
            "uri": uri,
            "option": option,
            "is_collection": is_collection,
            "handle": self.rxfind("terms/domain/(.*)", uri, 1),
            "module": self.rxfind("terms/domain/(.*?)(?=/)", uri, 1),
        }
        obj["output"] = self.fetch_output_string(obj)
        return obj

    def read_conf_toml(self):
        with open(self.conf_toml) as filedata:
            data = filedata.read()
            d = toml.loads(data)
            return d

    def read_xml_file(self):
        try:
            return ET.parse(self.domain_xml).getroot()
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

    def fetch_all_output_strings(self, mod):
        arr = []
        for el in mod:
            arr.append(el["output"])
        return arr

    def generate(self):
        iterator = sorted([el for el in vg.generator])
        for module_name in self.generator:
            outfile = pj(self.output_dir, module_name + ".xml")
            arr = [self.conf["prefix"]]
            arr.extend(self.fetch_all_output_strings(self.generator[module_name]))
            self.write_array_to_file(arr, outfile)
            # for el in vg.generator:
        #     print(el)
        # print(self.output_dir)


vg = ViewGenerator()
vg.generate()
