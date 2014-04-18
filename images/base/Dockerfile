FROM phusion/baseimage:0.9.9
MAINTAINER M0stH8 <m0sth8@gmail.com>

RUN mkdir /build
ADD . /build
RUN /build/install.sh

WORKDIR /home/app
USER app
ENV HOME /home/app
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LOGNAME app
ENV TERM xterm

CMD ["/sbin/my_init"]