#!/bin/bash
#1.creat dir
mkdir -p .rootdir/{cscope,scripts}
#2.creat cscope file
rm -f ./.rootdir/cscope/cscope.files
find $PWD -name "*.[ch]" > .rootdir/cscope/cscope.files
cscope -Rbq -i .rootdir/cscope/cscope.files

