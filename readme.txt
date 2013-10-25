运行方式
在运行前准备：
修改文件config里的内容，如下：
dbname="adms4h2";
dbuser="root";
dbpswd="";
dbhost="59.108.43.4";
#查询语句所在文件
file="mysql.sql";
#查询数据重定向到outputfile,可随意写
outputfile="result.txt";
#头放点存放临时文件，可随意写
spfile="sp.csv";
#示例log数据最终存放位置，固定格式，为想要的日期，最好是测试当天的前两天
finallog="2012-05-29.csv";

修改 run.sh、csvfactory.sh、mixed.sh有可执行权限。
csvfactory.sh文件 里面的data数组为0-23小时的pv量，可修改为想要的值
 
查看2012-05-29.csv为所需要的文件.

另外如果想同时做一个uv混淆测试，可以修改mixed.sh中数组
ippool=("192.168.1.0" "192.168.2.0" "192.168.3.0");
代表多出的几个user ip
uvdata=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24);
代表多出的user在0-23各时段内的pv量，置0表示该时段没有pv

完成后运行run.sh即可