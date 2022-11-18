#!/bin/bash
echo "Getting data from Web: football-data.uk"

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/2223/F1.csv' -H 'accept: /' > $2023

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/2122/F1.csv' -H 'accept: /' > $2022

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/2021/F1.csv' -H 'accept: /' > $2021

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1920/F1.csv' -H 'accept: /' > $2020

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1819/F1.csv' -H 'accept: /' > $2019

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1718/F1.csv' -H 'accept: /' > $2018

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1617/F1.csv' -H 'accept: /' > $2017

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1516/F1.csv' -H 'accept: /' > $2016

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1415/F1.csv' -H 'accept: /' > $2015

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1314/F1.csv' -H 'accept: /' > $2014

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1213/F1.csv' -H 'accept: /' > $2013

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1112/F1.csv' -H 'accept: /' > $2012

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/1011/F1.csv' -H 'accept: /' > $2011

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/0910/F1.csv' -H 'accept: /' > $2010

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/0809/F1.csv' -H 'accept: /' > $2009

curl -s -X 'GET' 'https://www.football-data.co.uk/mmz4281/0708/F1.csv' -H 'accept: /' > $2008