#!/bin/bash
set -e
source /build/buildconfig
set -x

apt-get clean
rm -rf /tmp/* /var/tmp/*
if [[ "$final" = 1 ]]; then
	rm -rf /build
else
	rm -f /build/{install,enable_repos,prepare,finalize}.sh
	rm -f /build/{Dockerfile,insecure_key*}
fi