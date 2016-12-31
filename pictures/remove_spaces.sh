HOMEDIR=`cat homedir.txt`
# Where are the files?
IMG_PATH="$HOMEDIR/images/"
find -name "* *" -type f | rename 's/ /_/g'