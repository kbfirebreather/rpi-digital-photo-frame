HOMEDIR=`cat homedir.txt`
# Where are the files?
IMG_PATH="$HOMEDIR/images/"
cd $IMG_PATH;
mogrify -auto-orient -resize "1024x768>" *.jpg
mogrify -auto-orient -resize "1024x768>" *.JPG
