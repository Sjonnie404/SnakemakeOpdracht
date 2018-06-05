counts <- read.delim(header=TRUE, file="data/RNA-Seq-counts.txt")

ID <- c(counts["ID"])

write.csv(ID, file = "data/countIDs.csv")
