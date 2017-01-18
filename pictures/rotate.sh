#!/bin/sh
HOMEDIR=`cat homedir.txt`
# Where are the image files?
IMG_PATH="$HOMEDIR/images/"

cd $IMG_PATH

FILE_LIST=`ls -1 *.jpg`

while i in $FILE_LIST
do
	convert $i -rotate 180 $i
done
