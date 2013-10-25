#!/bin/awk -f
BEGIN{
  FS=",";
  #filename="2012-05-21.csv";
  system("echo PlayTime,ChannelID\\(Movie\\),NodeID\\(User\\),UserIP,ViewDuration\\(Second\\),UserID,Factory,DeviceID,LenceseData > "filename);
}

{
  if( NR >1 ) {system("echo creating log for spotsid:"$1",content:"$2",save in "filename); system("./csvfactory.sh "filename" "$2);};
}

END{
  system("echo create log completed,save in "filename);
}
