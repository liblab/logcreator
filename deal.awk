#! /bin/awk -f
BEGIN{
  FS="\t";
  #filename="sp.csv";
  #echo "" > filename;
}
{ 
  split($3, content, "::")
  printf("%s,%s\n",$1,content[1]) >> filename;
}
END{
}
