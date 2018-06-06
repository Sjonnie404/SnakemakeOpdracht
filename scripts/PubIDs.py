from Bio import Entrez

Entrez.email = "shane.pullens@hotmail.com"     # Always tell NCBI who you are

input = snakemake.input[0]
output = snakemake.output[0]

file = open(input, "r")
outfile = open(output, "w")
db = "pubmed"
aantal = 50

for line in file:

    #print(line)
    handle = Entrez.esearch(db=db, term=line, retmax=aantal)
    record = Entrez.read(handle)
    idlist = record["IdList"]
    #print(idlist)
    if idlist != "[]":
        outfile.write("\n"+ str(idlist).replace("[","").replace("]","").replace("'","").replace(",",""))

outfile.close()

#
# handle = Entrez.esearch(db=db, term=zoekterm, retmax=aantal)
# record = Entrez.read(handle)
# idlist = record["IdList"]
# print(idlist)
