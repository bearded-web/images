FROM barbudo/phantomjs

USER app
RUN mkdir ~/scripts
WORKDIR /home/app/scripts

ENV VERSION 0.0.1

RUN curl -sSL https://github.com/SLonoed/retire.js/archive/master.tar.gz | tar xz \
	&& mv ./retire.js-master ./retirejs 

WORKDIR /home/app/scripts/retirejs/phantomjs/

ENTRYPOINT ["phantomjs", "--load-images=false", "./scan.js"]