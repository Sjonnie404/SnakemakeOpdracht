from dicttoxml import dicttoxml
import json
from xml.dom.minidom import parseString

#IDs = open("countsIDs.csv", "r")
IDs = snakemake.input[0]

array = []
for line in IDs:
    line = line.replace("\n", "")
    #print(line)
    #id.append(line)

    array.append(line)
#print(array)

xml = dicttoxml(array, custom_root='IDLIST',attr_type=False)
#print(xml)
xml = parseString(xml)
#print(xml.toprettyxml())

#outputFile = open("idXML.xml", "a")
outputFile = snakemake.output[0]
outputFile.write(xml.toprettyxml())
