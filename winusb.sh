#!/bin/sh
echo "SHASUM1" | shasum --algorithm 256 --check && \
echo "$2  $1" | shasum --algorithm 256 --check && \
echo "Checksum OK"
