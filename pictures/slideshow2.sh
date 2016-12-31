#!/bin/sh

# Where are the files?
IMG_PATH=`pwd`"/images/"

cd $IMG_PATH


# How long to run the command in seconds before killing it?
TIMEOUT=1

while true
do

# File list. Can either be hard-coded, space separated,
# or to use the output of a command, use $(command). The
# safest approach is to use a shell glob as I have done here.
FILE_LIST=*.jpg


FILES_COUNT=`ls -1 *.jpg | wc -l`


# For every file on the list...
#for FILE in $FILE_LIST
#do
  # OK, this is where the magic happens...
  # First invoke a shell and feed the mini script (in double quotes)
  # to that shell. The mini script first executes fbi with whatever
  # filename is now set to $FILE by the loop, meanwhile, whatever is
  # in brackets gets executed simultaneously (sleep for $TIMEOUT seconds
  # then force kill the second shell and all its children, including fbi).
  # What the heck is \$\$? Well, $$ normally refers to the process ID
  # of the script itself. But we don't want to kill the main script with
  # the for loop - we want to loop to go on. So we escape the $$ with
  # backslashes like so \$\$ so that literally "$$" gets passed to the
  # second subshell, so it kills only itself (and fbi as its child).
  #########################
  # You can add parameters to fbi if you need to.
  # Also you may want to try removing the -9 parameter to kill in
  # case it messes up your framebuffer... not sure how well fbi
  # handles a forceful (-9) vs. graceful (no -9) kill.
  killall -9 fbi
  fbi -T 2 -noverbose -u -a -t $TIMEOUT $FILE_LIST 
  sleep $(($TIMEOUT*$FILES_COUNT))
#done

done
