cd /home/pi/pictures;
for file in *.jpg; do convert $file -verbose -resize 1152x864\> $file; done
for file in *.JPG; do convert $file -verbose -resize 1152x864\> $file; done