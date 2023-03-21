#!/bin/bash

cd /home/owen/gentoo-buildhost/
mount -t proc none ./gentoo/proc
mount --rbind /sys ./gentoo/sys
mount --make-rslave ./gentoo/sys
mount --rbind /dev ./gentoo/dev
mount --make-rslave ./gentoo/dev
cp /etc/resolv.conf ./gentoo/etc

chroot ./gentoo /usr/bin/distccd --daemon --log-file /var/log/distccd.log --port 3632 --log-level critical --allow 192.168.0.0/24 --listen 0.0.0.0 -N 15
