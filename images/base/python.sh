#!/bin/bash
set -e
source /build/buildconfig
set -x

## Install Python.
apt-get install -y python python2.7
apt-get install -y python-software-properties python-setuptools python-dev

# install pip and distribute
sudo easy_install pip
sudo pip install distribute --upgrade