rpi-digital-photo-frame
=======================

Instructions on how to turn a linux system into a digital picture frame.


***************************************************
Install screensaver and imagemagick software, set homedir, create directory for the pictures and shell scripts to be housed, add program to run on startup:


1. sudo apt-get update && sudo apt-get install fbi imagemagick

1. pwd > homedir.txt

2. cd pictures

3. sudo mkdir images

4. Copy your images into the images dir

5. sudo chmod +x *.sh

6. Reboot & enjoy!



***************************************************
FAQ

**fbi is is displaying the images.

**imagemagick can automatically resize the images being used to help save storage.

**remove_spaces.sh will find any pictures being used by fbi that have spaces in the filenames and remove the spaces.

**This is because the resize script doesn't work with spaces in the filenames.

**resize.sh will resize any images that are larger AND ONLY LARGER than the set size.

**Currently this is set to 1024x768, but you can set it to whatever resolution you are running at.
