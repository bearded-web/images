#!/bin/bash
set -e
source /build/buildconfig
set -x

# this script only for base image

apt-get update
/build/utilities.sh
$minimal_apt_get_install git

/build/finalize.sh