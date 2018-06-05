# (c) Shane Pullens
# Globals   -----

# Rules     -----
rule all:
    input: 'idXML.xml'              #latest rule output file.

rule getGeneID:
    input:  "RNA-Seq-counts.txt"
    output: "countsIDs.csv"
    script: "getGenes.py"

rule listToXML:
    input:  "countsIDs.csv"
    output: "idXML.xml"
    script: "idListtoXML.py"

rule getNCBI:
    input: "countsIDs.csv"
    output: "NCBIids.csv"
    script: "getNCBIids.py"
