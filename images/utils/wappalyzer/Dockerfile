FROM barbudo/phantomjs

USER app
RUN mkdir ~/scripts
WORKDIR /home/app/scripts

ENV VERSION 0.0.1

RUN curl -sSL https://github.com/ElbertF/Wappalyzer/archive/master.tar.gz | tar xz \
	&& mkdir wappalyzer \ 
	&& mv Wappalyzer-master/drivers/phantomjs/js ./wappalyzer/js \
	&& cp Wappalyzer-master/share/apps.json ./wappalyzer/ \
	&& rm -rf ./Wappalyzer-master

WORKDIR /home/app/scripts/wappalyzer

ENTRYPOINT ["phantomjs", "--load-images=false", "./js/driver.js"]