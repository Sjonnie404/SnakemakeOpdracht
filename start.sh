#!/bin/sh
echo "*** (c) Shane Pullens"

echo "*** Creating virtual environment named 'SnakeMake'..."
python3 -m venv .SnakeMake

echo "*** Making Virtal environment executable..."
chmod +x .SnakeMake/bin/activate

echo "*** Start virtual environment with 'source .SnakeMake/bin/activate'"

echo " --> after starting type 'pip install snakemake'"

