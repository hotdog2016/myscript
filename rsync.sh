#!/bin/zsh
#
#
if [ "$1" = "" ];then
	echo "Please give a src dir!"
	exit
fi

SRC=$(cd $1; pwd)
#判断源目录是win的目录还是linux的目录
if [[  $SRC =~ "mnt/hgfs" ]];then
    echo "Is win"
	DES="/home/htodog/workspace/LN_stc12/"$(basename $SRC)
elif [[ $SRC =~ "workspace" ]];then
    echo "is linux workspace"
	DES="/mnt/hgfs/20191125_LN_Stc12_MasterMoudle/"$(basename $SRC)
else
	echo "No Rsync"
	exit
fi


if [[ -d "$DES" ]];then
	echo "$DES" 
else
	echo "no dir"
	exit
fi

LOGFILE="/dev/null"
EXCLUDEFILE="$SRC/rsync_exclude_list"

if [ ! -f "$EXCLUDEFILE" ];then
	echo "please create rsync_exclude_list!"
	exit
fi


if [[ "${SRC: -1}" != '/' ]];then
	SRC=$SRC"/"
fi

if [[ "${DES: -1}" != '/' ]];then
	DES=$DES"/"
fi

echo $SRC >> $LOGFILE
echo $DES >> $LOGFILE

/usr/bin/rsync -rv --delete --exclude-from="$EXCLUDEFILE" \
--progress "$SRC/" "$DES/"  >> $LOGFILE
