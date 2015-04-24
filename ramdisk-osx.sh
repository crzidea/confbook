#!/bin/sh
# Usage:
# mkdir -p /usr/local/sbin/
# ln -s path/to/ramdisk-osx.sh /usr/local/sbin/
# ln -s path/to/com.my.ramdisk.plist /Library/LaunchDaemons/

rd=ramdisk
rd_size_gb=16
rd_size_sectors=$(($rd_size_gb * 1024 * 1024 * 1024 / 512))

if [ ! -e "/Volumes/$rd" ];  then
  diskutil erasevolume HFS+ "$rd" `hdiutil attach -nomount ram://$rd_size_sectors`
fi

mkdir -p /Volumes/$rd/tmpdir \
  && export TMPDIR=/Volumes/$rd/tmpdir/
