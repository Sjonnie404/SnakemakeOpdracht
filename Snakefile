# Imports   -----
from snakemake.utils import R


# Globals   -----
FILE = 'data/RNA-Seq-counts.txt'


# Rules     -----
rule all:
    input:
        'data/RNA-Seq-counts.txt'

rule getGeneID:
    input:
        FILE
    output:
        'data/trimmedFile.txt'
    script:
        "{scripts/} trimIDs.r {input} {output}"


### STOPPED USING SNAKEMAKE BECAUSE OF SHITTY DOCUMENTATION & SMALL COMMUNITY ###
