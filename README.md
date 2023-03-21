This is a bash script to set up a gentoo buildhost chroot.

The script starts by downloading and extracting the latest stage3, then mounting all the required filesystems.

emerge-webrsync is then run, followed by emerge --sync

MAKEOPTS is configured to make use of every core

distcc is then emerged
