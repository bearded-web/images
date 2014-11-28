#!/bin/bash
set -e
source /build/buildconfig
set -x

curl -sSL https://storage.googleapis.com/golang/go$GOLANG_VERSION.linux-amd64.tar.gz | tar -C /usr/local/ -xz