#!/bin/bash
set -x

NMAP="nmap-6.45"

curl -o $NMAP.tar.bz2 http://nmap.org/dist/$NMAP.tar.bz2
bzip2 -cd $NMAP.tar.bz2 | tar xvf -
cd $NMAP
./configure --without-zenmap
make
make install
rm -rf '$NMAP'