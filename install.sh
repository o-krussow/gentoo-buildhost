#!/bin/bash

mkdir ./gentoo

STVERSION="$(curl https://mirror.bytemark.co.uk/gentoo//releases/amd64/autobuilds/current-stage3-amd64-openrc/ | grep -P -o -i "(stage3-amd64-openrc.*?\.tar.xz)" | uniq)"

curl https://mirror.bytemark.co.uk/gentoo//releases/amd64/autobuilds/current-stage3-amd64-openrc/$STVERSION > ./gentoo/stage3-amd64-openrc-latest.tar.xz

tar xpvf ./gentoo/stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner -C ./gentoo

./mountscript.sh

chroot ./gentoo emerge-webrsync

chroot ./gentoo emerge --sync

cp ./make.conf ./gentoo/etc/portage/make.conf

echo "MAKEOPTS=\"-j$(nproc)\"" >> ./gentoo/etc/portage/make.conf

chroot ./gentoo emerge distcc

echo "bash $(pwd)/boot_run_distcc.sh" >> /etc/rc.local

chmod +x /etc/rc.local