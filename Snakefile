# (c) Shane Pullens
# Globals   -----

# Rules     -----
rule all:
    input: 'data/report.html','data/idXML.xml'              #latest rule output file.
rule getGeneID:
    priority: 1
    input:  "data/RNA-Seq-counts.txt"
    output: "data/countsIDs.csv"
    script: "scripts/getGenes.py"

rule listToXML:
    priority: 2
    input:  "data/countsIDs.csv"
    output: "data/idXML.xml"
    script: "scripts/idListtoXML.py"

rule getPubmedCount:
    priority: 3
    input: "data/countsIDs.csv", "data/idXML.xml"
    output: "data/pubmedIDs.csv"
    script: "scripts/PubIDs.py"

rule delEmpthy:
    input : "data/pubmedIDs.csv"
    output: "data/pubmedIDsClean.csv"
    script: "scripts/cleanup.R"

rule sortPubID:
    input:  "data/pubmedIDsClean.csv"
    output: "data/sortedpubmedIDs.csv"
    shell:  "sort {input} > {output}"

rule abstract:
    input:  "data/sortedpubmedIDs.csv"
    output: "data/pubmed.csv"
    script: "scripts/pubmed.py"

rule report:
    input:
        T1= "data/pubmed.csv"
    output: "data/report.html"
    run:
        from snakemake.utils import report
        with open(input.T1) as vcf:
            n_calls = sum(1 for l in vcf if not l.startswith("#"))

        report("""
        An basic workflow report for the found NCBIpubmed articles.
        ===========================================================

        Reads were pulled from NCBI pubmed database.
        The search paramaters were the KEGG gene IDs.

        This resulted in {n_calls} variants (see Table T1_).
        Benchmark results for BWA can be found in the tables T2_.
        """, output[0], **input)
