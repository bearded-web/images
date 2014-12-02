## Images


Docker images for security audit

Base image is based on ubuntu:14.04

All builded images are available in docker registry http://registry.hub.docker.com/u/m0sth8

#### Make commands


Build base image, mark version as latest and push to registry

`make build_base tag_latest_base release_base`

Build utils or platform, mark version as latest ans push to registry

`make target=NAME build tag_latest release` 

#### Available platforms

 * golang - this one with go compiler and runtime
 * python - python 2.7 and python 3 
 * ruby - ruby 2.1 installed and also available for installation /build/ruby1.8.sh,ruby1.9.sh,ruby2.0.sh and ruby-switch.
 * nodejs - nodejs version v0.10.33 installed from chris-lea ppa
 * phantomjs - phantomjs without nodejs.


#### Available utils

 * nmap - Utility for network discovery and security auditing http://nmap.org/
 * w3af - Web Application Attack and Audit Framework http://w3af.org
 * wpscan - Scanner for wordpress wpscan.org
 * wappalyzer - Wappalyzer with phantomjs support https://github.com/SLonoed/phantalyzer 
 * wweb - Website Fingerprinter https://github.com/urbanadventurer/WhatWeb
 
#### Examples

Scan host with nmap

`docker run --rm -t -i m0sth8/nmap -A github.com`

Analyze technologies and web frameworks

`docker run --rm -t -i m0sth8/wappalyzer https://github.com`

`docker run --rm -t -i m0sth8/wweb https://github.com`
