FROM m0sth8/base:latest

ENV PHANTOMJS_VERSION 1.9.8

ADD . /phantomjs
RUN /phantomjs/install.sh && rm -rf /phantomjs

ENTRYPOINT ["phantomjs"]