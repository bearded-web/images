#!/bin/bash
set -e
source /build/buildconfig
set -x

## pi-rho security PPA
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 779C27D7
echo deb http://ppa.launchpad.net/pi-rho/security/ubuntu $ubuntu main > /etc/apt/sources.list.d/security.list

apt-get update

$minimal_apt_get_install nmap

/build/finalize.sh