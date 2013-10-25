#! /bin/bash
#config=$1
source config
dbname=$dbname;
dbuser=$dbuser;
dbpswd=$dbpswd;
dbhost=$dbhost;
file=$file;
outputfile=$outputfile;
spfile=$spfile;
finallog=$finallog;

mysql -h $dbhost -u $dbuser -p -e "use $dbname;set names gbk;source $file;" > $outputfile;
if [ -f "$spfile" ]; then
  touch "$spfile"
  rm $spfile;
  touch "$spfile"
fi 
awk -f deal.awk -v filename=$spfile $outputfile;
awk -f createdata.awk -v filename=$finallog $spfile;
