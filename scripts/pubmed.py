from Bio import Entrez, Medline
Entrez.email = "shane.pullens@hotmail.com"     # Always tell NCBI who you are


input = snakemake.input[0]
output = snakemake.output[0]

#input = "sortedpubmedIDs.csv"
#output = "pubmed.csv"
alldata = []
lines = ""

file = open(input, "r")
outfile = open(output, "w")

for line in file:
    lines += line

IDs = [s for s in lines.split() if s.isdigit()]

#print(IDs)
# print(lines)
# print(lines.split("\n"))


handle = Entrez.efetch(db="pubmed", id=IDs, rettype="medline",
                        retmode="text")
records = Medline.parse(handle)         #records is an iterator here.
records = list(records)                 #to recall records it makes it possible to go trough it multiple times.
#print(records)


for record in records:
    outfile.write("""
    Title: \t\t """+str(record.get("TI", "?"))+"""
    Author: \t\t """+str(record.get("AU", "?"))+"""
    Abstract: \t\t """+str(record.get("AB", "?"))+"""\n
    ------------------------------------------------------------------
    """
    )
