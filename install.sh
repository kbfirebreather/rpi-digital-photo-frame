#!/bin/bash

sudo apt-get update && sudo apt-get install fbi imagemagick

cd pictures
pwd > homedir.txt
sudo chmod +x *.sh
mkdir images
cd ..

chmod +x slideshow
sudo cp slideshow /etc/init.d
sudo update-rc.d slideshow defaults 91
