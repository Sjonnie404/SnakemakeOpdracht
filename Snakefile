# (c) Shane Pullens
# Globals   -----

# Rules     -----
rule all:
    input: 'pubmedIDs.csv'              #latest rule output file.

rule getGeneID:
    priority: 1
    input:  "RNA-Seq-counts.txt"
    output: "countsIDs.csv"
    script: "getGenes.py"

rule listToXML:
    priority: 2
    input:  "countsIDs.csv"
    output: "idXML.xml"
    script: "idListtoXML.py"

rule getPubmedCount:
    priority: 3
    input: "countsIDs.csv", "idXML.xml"
    output: "pubmedIDs.csv"
    script: "PubIDs.py"

# rule getNCBI:
#     input: "idXML.xml"
#     output: "NCBIids.csv"
#     script: "getNCBIids.py"
