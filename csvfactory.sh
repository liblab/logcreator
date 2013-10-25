#!/bin/bash
filename=$1;
spot=$2;
data=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24);
#echo "PlayTime,ChannelID(Movie),NodeID(User),UserIP,ViewDuration(Second),UserID,Factory,DeviceID,LenceseData" > $filename;
date=${filename:0:10};
function get_random()
{
   randomnu=$1;
   result=$(( $RANDOM % $randomnu ));
   echo ${result};
}

function create_hour()
{
  hour=$1;
  hour="0${hour}";
  hour=${hour:(-2)};
  echo ${hour};
}

function create_minute()
{
  minute=`get_random 60`;
  minute="0${minute}";
  minute=${minute:(-2)};
  echo ${minute};
}

function create_second()
{
  second=`get_random 60`;
  second="0${second}";
  second=${second:(-2)};
  echo ${second};
}

function create_date()
{
   hour=$1;
   hour=`create_hour $hour`;
   minute=`create_minute`;
   second=`create_second`;
   echo ${hour}:${minute}:$second;  
}

function create_ip()
{
  ipfield1=$1;
  ipfield2=$2;
  let ipfield1++;
  let ipfield2++;
  ip="${ipfield1}.${ipfield2}";
  for(( i=0;i<2;i++ ))
  do
     ipfield=`get_random 255`;
     ip="${ip}.${ipfield}";
  done
  echo ${ip};
}

for((j=0;j<24;j++))
do
   for((i=0;i<${data[j]};i++))
   do
     result=`create_date $j`;
     resultdate="${date} ${result}";
     resultip=`create_ip $j $i`;
     echo "${resultdate},${spot},,${resultip},,,,," >> $filename;
   done
done
`./mixed.sh ${filename} ${spot}`

