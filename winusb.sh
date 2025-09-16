#!/bin/sh
echo "SHASUM1" | shasum --algorithm 256 --check && \
echo "$2  $1" | shasum --algorithm 256 --check && \
echo "Checksum OK" && \
mkdir mnt && \
hdiutil attach $1 -readonly -mountpoint mnt && \
hdiutil detach mnt && \
rmdir mnt && \
echo "OK"
