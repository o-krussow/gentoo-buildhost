#!/bin/bash
chroot ./gentoo /usr/bin/distccd --daemon --log-file /var/log/distccd.log --port 3632 --log-level critical --allow 192.168.0.0/24 --listen 0.0.0.0 -N 15  
