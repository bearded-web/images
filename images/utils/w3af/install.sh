#!/bin/bash
set -e
source /build/buildconfig
set -x
# some part of this script was taken from https://registry.hub.docker.com/u/andresriancho/w3af/dockerfile/

apt-get update
$minimal_apt_get_install git

# Install basic requirements, python-lxml because it doesn't compile correctly from pip
$minimal_apt_get_install libyaml-dev python-lxml

cd /home/app/
git clone --depth 1 https://github.com/andresriancho/w3af.git w3af
cd /home/app/w3af

set +e
./w3af_console
set -e

# Change the install script to add the -y and not require input
sed 's/sudo apt-get/apt-get -y --no-install-recommends/g' -i /tmp/w3af_dependency_install.sh
sed 's/sudo pip/pip/g' -i /tmp/w3af_dependency_install.sh

chmod +x /tmp/w3af_dependency_install.sh
/tmp/w3af_dependency_install.sh

# Compile the py files into pyc in order to speed-up w3af's start
python -m compileall .
chown -R app /home/app/w3af

# clean
rm -rf /tmp/pip-build-root /tmp/w3af_dependency_install.sh
/build/finalize.sh