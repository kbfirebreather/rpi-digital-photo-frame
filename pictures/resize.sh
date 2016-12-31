IMG_PATH=`pwd`"/images/"
cd $IMG_PATH;
mogrify -resize "1024x768>" *.jpg
mogrify -resize "1024x768>" *.JPG
