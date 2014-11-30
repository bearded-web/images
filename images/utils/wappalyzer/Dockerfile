FROM m0sth8/phantomjs

USER app
RUN mkdir ~/scripts
WORKDIR /home/app/scripts

RUN curl -sSL https://github.com/SLonoed/phantalyzer/archive/master.tar.gz | tar xz \
	&& mv phantalyzer-master phantalyzer


ENTRYPOINT ["phantomjs", "--load-images=false", "./phantalyzer/phantalyzer.js"]