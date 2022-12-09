#!/bin/bash
function forlog {
NOW="$(date +"%Y-%m-%d-%H%M%S")"
FILE="log-$NOW.txt"
echo $FILE
}

rm -rf /home/development/Documents/debootcamp/mini_project1/downloadedfiles/*

for year in {2020..2022}; 
do wget -P /home/development/Documents/debootcamp/mini_project1/downloadedfiles --content-disposition "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=48549&Year=${year}&Month=2&Day=14&timeframe=1&submit= Download+Data" -o $(forlog);
done;

if [ $? -eq 0 ]
then python3 /home/development/Documents/debootcamp/mini_project1/concatenating_csvs.py
else 
echo $?
fi;

if [ $? -eq 0 ]
then
echo SUCCESS
else 
echo $?
fi;
