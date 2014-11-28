#!/bin/bash
set -e
source /build/buildconfig
set -x

## Install Python.
$minimal_apt_get_install python3