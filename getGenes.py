import pandas as pd
input = snakemake.input[0]
output = snakemake.output[0]

data = pd.read_csv(input, sep="\t")

df1 = data['ID']
print(df1)

df1.to_csv(output, sep='\t', encoding='utf-8', index=False)
