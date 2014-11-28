FROM m0sth8/ruby


ADD . /wpscan

RUN /wpscan/install.sh && rm -rf /wpscan

USER app

RUN cd ~ && git clone https://github.com/wpscanteam/wpscan.git wpscan \
	 && cd ./wpscan \
	 && bundle install --path ~/.gem --without test development 

WORKDIR /home/app/wpscan
RUN chmod +x ./wpscan.rb

ENTRYPOINT ["./wpscan.rb"]