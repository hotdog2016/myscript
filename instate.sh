#!/bin/bash
for name in $(grep "[\ \(]P_" -rl ./)
do
	externname=$(basename $name)	
	if [ "${externname##*.}" == "swp" ] || [ "${externname##*.}" == "cn"  ];then
		echo "$name"
#		rm $name
	elif [  "${externname##*.}" == "c" ];then
		if [ "$externname" == "main.c"  ];then
			echo "main.c"
		else 
			echo "$name"
#			sed -i "s/P\_/PT_/g" $name
		fi
	fi
done

