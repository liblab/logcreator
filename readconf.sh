#! /bin/bash
#config=$1
while read -r line
do
  eval "$line" 
done < config
echo $ID
echo $IP
echo $Name

source config
echo $ID
