#!/bin/bash

temp=$(dirname $(find $PWD -name '*.h' ))

#将结果导入到test1这个文件中，马上会对这个文件做一些修改，然后加到ycm配置文件里面去
echo "$temp"  > test1

#删除重复的路径
sort -n test1 | uniq > test2

#将每一行都变成'adb/adfadf/', 这种形式
#行首加'
sed -i "s/^/-I/g" test2
##行尾加'
#sed -i "s/$/\'/g" test2
##行尾加，
#sed -i "s/$/\,/g" test2
##向文件里面插入'-I',
#sed -i '$!G' test2 #先在每行之间插入空行
#sed -i "s/^$/'-I',/g" test2 #把空行替换成'-I',
#
##在.ycm_extra_conf 文件里面插入已经修改好的文本内容
#sed -i "/'\/usr\/local\/include',/ r test2" .ycm_extra_conf.py

