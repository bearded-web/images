#!/bin/bash
set -e
source /build/buildconfig
set -x

## Install Python.
$minimal_apt_get_install python python2.7 python-software-properties python-setuptools python-dev

# install pip and distribute
sudo easy_install pip
sudo pip install distribute --upgrade