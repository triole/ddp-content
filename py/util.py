import datetime
import re

import defusedxml.ElementTree as et
import pytz
import toml


def now():
    now = datetime.datetime.now()
    timezone = pytz.timezone("Europe/Berlin")
    local_now = timezone.localize(now)
    return local_now.strftime("%Y-%m-%dT%H:%M:%S.%f%z")


def rxfind(rx, s, gr=0):
    match = re.search(rx, str(s))
    if bool(match) is True:
        return match.group(gr)
    else:
        return None


def to_bool(s):
    if str(s).lower() == "true":
        return True
    return False


def read_toml_file(file_path):
    with open(file_path) as filedata:
        data = filedata.read()
        d = toml.loads(data)
        return d


def read_xml_file(file_path):
    try:
        return et.parse(file_path).getroot()
    except Exception as e:
        print("Xml parsing error: " + str(e))
