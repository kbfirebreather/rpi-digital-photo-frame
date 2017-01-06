#!/bin/bash

cd pictures
chmod +x *.sh
mkdir images

cd ..

chmod +x slideshow
sudo cp slideshow /etc/init.d
sudo update-rc.d slideshow defaults 91
