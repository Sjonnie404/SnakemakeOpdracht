input = snakemake@input[1]
output = snakemake@output[1]
y <- getwd()

data <- read.delim(header=TRUE, file= file.path(input))
#data = read.csv(input, header = TRUE)
data <- data[!apply(data == "", 1, all),]

write.table(data, file = toString(output), sep="\t", quote=F, row.names=F)