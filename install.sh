#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt-get update && apt-get install fbi imagemagick

cd pictures
pwd > homedir.txt
chmod +x *.sh
mkdir images
chmod 777 images

cat <<EOT >> /etc/init.d/slideshow
#! /bin/sh
### BEGIN INIT INFO
# Provides:          slideshow
# Required-Start:    \$remote_fs \$syslog
# Required-Stop:     \$remote_fs \$syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO
case "\$1" in
    start)
        echo "Starting slideshow"
        cd `pwd`
        ./slideshow.sh
    ;;
    stop)
        echo -n "Shutting down slideshow"
        for i in \`ps aux | grep './slideshow.sh' | grep -v grep | awk '{print $2}'\`
        do
          kill -9 \$i
        done
        killall -9 fbi
    ;;
    *)
        echo "Usage: \$0 {start|stop}"
        exit 1
esac
exit 0
EOT

chmod +x /etc/init.d/slideshow
update-rc.d slideshow defaults 91

echo -e "\n -Done-\n"
