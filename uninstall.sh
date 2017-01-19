#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

service slideshow stop
killall -9 slideshow.sh
killall -9 fbi

update-rc.d slideshow remove
rm /etc/init.d/slideshow
systemctl daemon-reload

echo -e "\n -Done-\n"
