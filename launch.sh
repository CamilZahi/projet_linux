#!/bin/bash
echo "Getting data from Web: football-data.uk"

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/2223/F1.csv' -H 'accept: /' > $2023
cp $2023 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/2122/F1.csv' -H 'accept: /' > $2022
cp $2022 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/2021/F1.csv' -H 'accept: /' > $2021
cp $2021 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1920/F1.csv' -H 'accept: /' > $2020
cp $2020 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1819/F1.csv' -H 'accept: /' > $2019
cp $2019 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1718/F1.csv' -H 'accept: /' > $2018
cp $2018 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1617/F1.csv' -H 'accept: /' > $2017
cp $2017 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1516/F1.csv' -H 'accept: /' > $2016
cp $2016 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1415/F1.csv' -H 'accept: /' > $2015
cp $2015 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1314/F1.csv' -H 'accept: /' > $2014
cp $2014 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1213/F1.csv' -H 'accept: /' > $2013
cp $2013 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1112/F1.csv' -H 'accept: /' > $2012
cp $2012 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1011/F1.csv' -H 'accept: /' > $2011
cp $2011 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/0910/F1.csv' -H 'accept: /' > $2010
cp $2010 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/0809/F1.csv' -H 'accept: /' > $2009
cp $2009 data/

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/0708/F1.csv' -H 'accept: /' > $2008
cp $2008 data/

echo "Etape Data : Téléchargement réussi"

python code_propre.py
