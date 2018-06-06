#!/bin/sh
echo "*** (c) Shane Pullens"

echo "*** Creating virtual environment named 'SnakeMake'..."
python3 -m venv .SnakeMake

echo "*** Making Virtal environment executable..."
chmod +x .SnakeMake/bin/activate

echo "*** Start virtual environment..."
source .SnakeMake/bin/activate

echo "***Installing SnakeMake in virtual environment..."
pip3 install snakemake

echo "***Installing other needed librarys..."
pip3 install biopython
pip3 install pandas
pip3 install dicttoxml

echo "***Running snakemake"
snakemake

echo "***Generating workflow"
snakemake --forceall --dag | dot -Tpdf > data/dag.pdf

echo "***Exiting virtual env"
deactivate
