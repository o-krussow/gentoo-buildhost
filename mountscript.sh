#!/bin/bash

mount -t proc none ./gentoo/proc
mount --rbind /sys ./gentoo/sys
mount --make-rslave ./gentoo/sys
mount --rbind /dev ./gentoo/dev
mount --make-rslave ./gentoo/dev
cp /etc/resolv.conf ./gentoo/etc

