#!/bin/sh
HOMEDIR=`cat homedir.txt`
# Where are the image files?
IMG_PATH="$HOMEDIR/images/"

cd $IMG_PATH

FILE_LIST=`ls -1 *.jpg`

for i in $FILE_LIST
do
if [[ $i =~ _rotated.jpg$ ]]; then
	NEWNAME=$( $i | cut -f 1 -d '.' )
	convert $i -rotate 180 $NEWNAME_rotated.jpg
else
	echo "nothing to do";
fi
done
