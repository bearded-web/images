#!/bin/bash
set -e
source /build/buildconfig
set -x

apt-get update

$minimal_apt_get_install git

/build/finalize.sh