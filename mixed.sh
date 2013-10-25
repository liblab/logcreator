#!/bin/bash
filename=$1;
channelid=$2;
date=${filename:0:10};
ippool=("192.168.1.0" "192.168.2.0" "192.168.3.0");
uvdata=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24);
function get_time()
{
  hour=$1;
  minitus=$(( $RANDOM % 60 ));
  seconds=$(( $RANDOM % 60 ));
  hour="0${hour}";
  minitus="0${minitus}";
  seconds="0${seconds}";
  hour=${hour:(-2)};
  minitus=${minitus:(-2)};
  seconds=${seconds:(-2)};
  echo "$date ${hour}:${minitus}:${seconds}";
}

for(( i=0;i<3;i++ ))
do
   for(( j=0;j<24;j++ ))
   do
      for(( k=0;k<${uvdata[j]};k++ ))
      do
         time=`get_time $j`;
         echo  ${time},$channelid,,${ippool[i]},,,,, >> $filename;   
      done
   done
done
