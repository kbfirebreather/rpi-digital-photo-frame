rpi-digital-photo-frame
=======================

Instructions on how to turn a linux system into a digital picture frame.

***************************************************
Set the console to automatically login the 'pi' user:

1. sudo vi /etc/inittab

2. find 1:2345:respawn:/sbin/getty --noclear 38400 tty1  
	2.1 set to #1:2345:respawn:/sbin/getty --noclear 38400 tty1  
	2.2 Append after this line: 1:2345:respawn:/bin/login -f pi tty1 </dev/tty1   
	
3. Save and quit


***************************************************
Install screensaver and imagemagick software:

1. sudo apt-get update

2. sudo apt-get install fbi imagemagick

fbi is what will be the driver behind the screen saver

imagemagick is so we can automatically resize the images being used to help save on storage


***************************************************
Create directory for the pictures and shell scripts to be housed:

1. cd pictures

2. sudo mkdir images

3. Copy your images into the images dir

4. sudo chmod +x *.sh


***************************************************
Set cronjobs to do some work:

1. sudo crontab -e

2. Insert the following jobs:  
	2.2		"30  11 * * * /home/pi/pictures/remove_spaces.sh"  
	2.3		"0   12 * * * /home/pi/pictures/resize.sh"  
	
3. Save and quit

remove_spaces.sh will find any pictures being used by fbi that have spaces in the filenames and remove the spaces. This is because the resize script doesn't work with spaces in the filenames.

resize.sh will resize any images that are larger AND ONLY LARGER than the set size. Currently this is set to 1152x864, but you can set it to whatever resolution you are running at.
***************************************************
Set the screensaver shell script to run when the pi boots up

1. sudo vi /etc/rc.local

2. Locate the line: "exit 0"

3. Before that line insert:  
	3.1 bash /home/pi/pictures/slideshow.sh
	
4. Save and quit

At this point, you should be set and good to go.
