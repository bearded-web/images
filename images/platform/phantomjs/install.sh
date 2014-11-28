#!/bin/bash
set -e
source /build/buildconfig
set -x

apt-get update
$minimal_apt_get_install libfreetype6 libfontconfig1

curl -sSL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 | tar -C /usr/local/share -xj
# curl -sSL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 | tar -C /usr/local/share -xj

ln -s /usr/local/share/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

/build/finalize.sh