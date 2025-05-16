#! /bin/bash
city=abuja

year=$(date -u +%Y)
month=$(date -u +%m)
day=$(date -u +%d)
hour=$(date -u +%H)
minute=$(date -u +%M)

obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°' | grep -Eo -e '-?[[:digit:]].*')
# echo "current temperature of $city : $obs_temp"

fc_temp=$(curl -s wttr.in/$city?T | grep -m 3 '°' | tail -1 | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
# echo "forecasted temperature of $city : $fc_temp"

data=$(echo -e "$year\t$month\t$day\t$hour\t$minute\t$obs_temp\t$fc_temp")
echo $data>>result.log