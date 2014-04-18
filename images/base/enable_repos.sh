#!/bin/bash
set -e
source /build/buildconfig
set -x

## Brightbox Ruby 1.9.3 and 2.0.0
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6
echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu precise main > /etc/apt/sources.list.d/brightbox.list

## Chris Lea's Node.js PPA
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12
echo deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu precise main > /etc/apt/sources.list.d/nodejs.list

## Rowan's Redis PPA
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5862E31D
echo deb http://ppa.launchpad.net/rwky/redis/ubuntu precise main > /etc/apt/sources.list.d/redis.list

apt-get update