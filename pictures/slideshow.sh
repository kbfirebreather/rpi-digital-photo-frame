#/bin/sh
IMG_PATH=`pwd`"/images/"
fbi -noverbose -u -a -t 10 $IMG_PATH*.jpg $IMG_PATH*.JPG
