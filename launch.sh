#!/bin/bash
echo "Getting data from Web: football-data.uk"

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/2223/F1.csv' -H 'accept: /' > $2023
cp $2023 data/2023.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/2122/F1.csv' -H 'accept: /' > $2022
cp $2022 data/2022.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/2021/F1.csv' -H 'accept: /' > $2021
cp $2021 data/2021.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1920/F1.csv' -H 'accept: /' > $2020
cp $2020 data/2020.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1819/F1.csv' -H 'accept: /' > $2019
cp $2019 data/2019.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1718/F1.csv' -H 'accept: /' > $2018
cp $2018 data/2018.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1617/F1.csv' -H 'accept: /' > $2017
cp $2017 data/2017.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1516/F1.csv' -H 'accept: /' > $2016
cp $2016 data/2016.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1415/F1.csv' -H 'accept: /' > $2015
cp $2015 data/2015.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1314/F1.csv' -H 'accept: /' > $2014
cp $2014 data/2014.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1213/F1.csv' -H 'accept: /' > $2013
cp $2013 data/2013.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1112/F1.csv' -H 'accept: /' > $2012
cp $2012 data/2012.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1011/F1.csv' -H 'accept: /' > $2011
cp $2011 data/2011.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/0910/F1.csv' -H 'accept: /' > $2010
cp $2010 data/2010.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/0809/F1.csv' -H 'accept: /' > $2009
cp $2009 data/2009.csv

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/0708/F1.csv' -H 'accept: /' > $2008
cp $2008 data/2008.csv

for file in $2023 $2022 $2021 $2020 $2019 $2018 $2017 $2016 $2015 $2014 $2013 $2012 $2011 $2010 $2009 $2008
do
  cp $file data/${file}.csv
done

echo "Etape Data : Téléchargement réussi"


python3 code_propre.py
