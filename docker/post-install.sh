#! /bin/bash
python -m spacy download en_core_web_lg
apt-get update && apt-get -y install git graphviz
pip install git+https://github.com/maciejkula/spotlight.git
apt install wget unzip
cd /tf/notebooks
wget https://recommenderdata.s3.amazonaws.com/movielens/movielens.zip
unzip movielens.zip
rm movielens.zip
