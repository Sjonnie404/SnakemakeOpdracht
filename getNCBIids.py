from Bio import Entrez

Entrez.email = "shane.pullens@hotmail.com"     # Always tell NCBI who you are

IDs = open("countsIDs.csv", "r")
id = []

for line in IDs:
    line = line.replace("\n", "")
    print(line)
    id.append(line)
    #id += line

print(id)

handle = Entrez.efetch(db="gene", id=id, rettype="gb", retmode="text")
record = Entrez.read(handle)
handle.close()

print(record.id)
print(record.name)
print(record.description)
print(len(record.features))
print(repr(record.seq))


# Entrez.email = "shane.pullens@hotmail.com"     # Always tell NCBI who you are
# handle = Entrez.egquery(term=zoekterm)          #Hier wordt de zoekterm meegegeven.
# record = Entrez.read(handle)
#
# for row in record["eGQueryResult"]:
#     if row["DbName"]== db:
#         aantal = row["Count"]
#         #print(aantal)
#
# handle = Entrez.esearch(db=db, term=zoekterm, retmax=aantal)
# record = Entrez.read(handle)
# idlist = record["IdList"]
# #print(idlist)
