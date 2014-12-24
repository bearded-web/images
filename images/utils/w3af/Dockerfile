FROM barbudo/python

ADD . /w3af
RUN /w3af/install.sh && rm -rf /w3af

USER app
WORKDIR /home/app/w3af

ENTRYPOINT ["./w3af_console"]
