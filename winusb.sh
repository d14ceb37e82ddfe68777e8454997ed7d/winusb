#!/bin/sh
echo "SHASUM1" | shasum --check && \
echo "$2  $1" | shasum --check && \
diskutil eraseDisk -noEFI FAT32 %noformat% GPT $3 && \
sudo newfs_msdos -F 32 -v WINDOWS $3s1 && \
diskutil mount nobrowse $3s1 && \
mkdir mnt && \
hdiutil attach $1 -readonly -mountpoint mnt && \
rsync --archive --max-size 3800M mnt/ /Volumes/WINDOWS/ && \
xattr -c wimsplit && \
./wimsplit mnt/sources/install.wim /Volumes/WINDOWS/sources/install.swm 3800 && \
hdiutil detach mnt && \
rmdir mnt && \
diskutil eject $3 && \
echo "OK"
