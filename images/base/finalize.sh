#!/bin/bash
set -e
source /build/buildconfig
set -x

apt-get clean
rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*