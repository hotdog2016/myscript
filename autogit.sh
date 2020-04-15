#bin/bash

CURRENT=$(date "+%Y-%m-%d %H:%M:%S")
git add .
git commit -m "$CURRENT" && git push myscript master

