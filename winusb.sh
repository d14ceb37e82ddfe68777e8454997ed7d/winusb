#!/bin/sh
echo "SHASUM1" | shasum --algorithm 256 --check && \
echo "$2  $1" | shasum --algorithm 256 --check && \
echo "Checksum OK" && \
mkdir mnt && \
hdiutil attach $1 -readonly -mountpoint mnt && \
diskutil eraseDisk -noEFI FAT32 Windows GPT $3 && \
rsync --archive --max-size 3800M mnt/ /Volumes/Windows/ && \
xattr -c wimsplit && \
./wimsplit mnt/sources/install.wim /Volumes/Windows/sources/install.swm 3800 && \
diskutil eject $3 && \
hdiutil detach mnt && \
rmdir mnt && \
echo "OK"
