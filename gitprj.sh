#!/bin/bash

gitfile="autogit.sh"
gitdir=".git"

function autocommit {
	cd $1 
	echo "now dir is ${PWD}"
	if [  -d "$gitdir" ]; then
		echo "find .git dir"
		if [  -f "$gitfile" ]; then
				./$gitfile
			echo "$PWD git OK!"
			echo "###################################"
			else
				echo "$PWD can't find autogit.sh"
				return	
		fi
	else
		echo "$PWD can't find .git"
		return	
	fi
}

autocommit ~/workspace/C
autocommit ~/workspace/myscript
autocommit ~/.config
autocommit ~/vimwiki

