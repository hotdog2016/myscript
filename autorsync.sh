#!/bin/zsh
SRC="$1/"
DES="$2/"
LOGFILE="/dev/null"
EXCLUDEFILE="$1/rsync_exclude_list"
INOTIFYFILES="$1/inotify_file"

cd $SRC

echo "$PWD"

if [ "$1" = "" ];then
	echo "please give a src dir!"
	exit
fi

if [ "$2" = "" ];then
	echo "please give a des dir!"
	exit
fi

if [ ! -f "rsync_exclude_list" ];then
	echo "please create rsync_exclude_list!"
	exit
fi


echo $SRC >> $LOGFILE
echo $DES >> $LOGFILE

/usr/bin/inotifywait -mrq \
	--exclude '((.*/*\.log|.*/*\.OBJ|.*/*\.hex|.*/*\.lnp)$|.*/*\.git.*|.*rsync.*|.*\.build_log.*|.*\.yujin.*|.*\.Administrator.*|.*/(OBJ|Objects|Listings|SI)|.*inotify.*)' \
	--timefmt '%d/%m/%y %H:%M' \
	--format '%T %w%f  %e' \
-e modify,delete,create,move $SRC | while read x
    do
        /usr/bin/rsync -arv --delete --exclude-from="$EXCLUDEFILE" \
			--progress $SRC $DES  >> $LOGFILE
        echo "$x was rsynced" >> $LOGFILE
    done

