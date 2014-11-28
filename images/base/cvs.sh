#!/bin/bash
set -e
source /build/buildconfig
set -x

## Bundler has to be able to pull dependencies from git.
$minimal_apt_get_install git mercurial bzr