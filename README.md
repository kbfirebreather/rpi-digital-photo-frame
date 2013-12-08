rpi-digital-photo-frame
=======================

Instructions on how to turn a Raspberry Pi into a digital picture frame.

First things first. Flash raspbian to a flash drive to boot the pi off of. Instructions can be found at: http://www.raspberrypi.org/downloads

Once done...

1. Insert the SD card and boot the pi.

2. If on an existing system, or the initial boot didn't automatically run the configuration, execute from cmd line:  
	2.1 sudo raspi-config

***************************************************
Now that you're in the cofiguration software:

1. Select Enable Boot to Desktop/Scratch  
	1.1 Set to Console Text console, requiring login
	
2. Select Internationalisation Options  
	2.1 Select your specific Timezone  
	2.2 Set the keyboard layout to US
	
3. Select Overclock  
	3.1 Select Medium (or whatever you prefer)
	
4. Select Advanced Options  
	4.1 Select Memory Split  
	4.2 Set to 128
	
5. Select Finish

6. Reboot

US Keyboard layout is selected because special characters on the keyboard were different as I'm in the US. # would turn into the English Pound sign, and other various symbols would be switched around.


***************************************************
Set the console to automatically login the 'pi' user:

1. sudo vi /etc/inittab

2. find 1:2345:respawn:/sbin/getty --noclear 38400 tty1  
	2.1 set to #1:2345:respawn:/sbin/getty --noclear 38400 tty1  
	2.2 Append after this line: 1:2345:respawn:/bin/login -f pi tty1 </dev/tty1   
	
3. Save and quit


***************************************************
Install screensaver software, ftp software, and imagemagick software:

1. sudo apt-get update

2. sudo apt-get install fbi

3. sudo apt-get install proftpd  
	3.1 Select standalone for the proftpd software
	
4. sudo apt-get install imagemagick
	
5. sudo reboot

fbi is what will be the driver behind the screen saver

proftpd is so we can copy the pictures to the pi

imagemagick is so we can automatically resize the images being used to help save on storage


***************************************************
Create directory for the pictures and shell scripts to be housed:

1. cd /home/pi

2. sudo mkdir pictures

3. Copy contents of the pictures directory in this repository to the pictures directory you just created

4. sudo chmod +x *.sh


***************************************************
Set cronjobs to do some work:

1. sudo crontab -e

2. Insert the following jobs:  
	2.1		0   0  * * * /home/pi/pictures/restart.sh  
	2.2		30  11 * * * /home/pi/pictures/remove_spaces.sh  
	2.3		0   12 * * * /home/pi/pictures/resize.sh  
	
3. Save and quit

restart.sh will reboot the pi every night at midnight. This is done because it seems the fbi software does not detect newly added pictures to the directory

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
