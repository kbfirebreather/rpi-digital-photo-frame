#!/bin/bash

HOMEDIR=`cat homedir.txt`
# Where are the image files?
IMG_PATH="$HOMEDIR/images/"

cd $IMG_PATH

FILE_LIST=`ls -1 *.jpg`

for i in $FILE_LIST; do
        if [[ ! $i =~ _rotated.jpg$ ]]; then
                NEWNAME=$( echo "$i" | cut -f 1 -d '.' )
                convert $i -rotate 180 $NEWNAME"_rotated.jpg"
                rm -rf $i
        fi
done
