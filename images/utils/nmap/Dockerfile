FROM m0sth8/base

USER root
WORKDIR /root
ADD . /nmap

RUN /nmap/nmap.sh

ENTRYPOINT ["nmap"]