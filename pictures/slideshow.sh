#!/bin/sh
HOMEDIR=`cat homedir.txt`
# Where are the image files?
IMG_PATH="$HOMEDIR/images/"
# How long between transitions?
TIMEOUT=`cat delay.txt`

cd $IMG_PATH

while true
do
        ../remove_spaces.sh
        ../resize.sh
        ../rotate.sh

        FILE_LIST=`ls -1 *.jpg`
        FILES_COUNT=`ls -1 *.jpg | wc -l`

        killall -9 fbi
        fbi -T 2 -noverbose -u -a -t $TIMEOUT $FILE_LIST
        sleep $(($TIMEOUT*$FILES_COUNT))
done
