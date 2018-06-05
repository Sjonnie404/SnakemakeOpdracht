from dicttoxml import dicttoxml
import json
from xml.dom.minidom import parseString

input = snakemake.input[0]
output = snakemake.output[0]

#IDs = open("countsIDs.csv", "r")
IDs = open(input, "r")
print(IDs)

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
print(xml.toprettyxml())
xml = xml.toprettyxml()

#outputFile = open("idXML.xml", "a")

outputFile = open(output, "a")
outputFile.write(xml)
