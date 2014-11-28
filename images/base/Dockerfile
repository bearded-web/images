FROM ubuntu:14.04
MAINTAINER M0stH8 <m0sth8@gmail.com>


RUN mkdir /build
ADD . /build
RUN /build/install.sh && rm /build/install.sh /build/Dockerfile

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en