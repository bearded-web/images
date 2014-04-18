FROM m0sth8/base

USER root
RUN ruby-switch --set ruby2.1

USER app
WORKDIR /home/app

RUN git clone https://github.com/wpscanteam/wpscan.git

WORKDIR /home/app/wpscan

RUN bundle install --path ~/.gem --without test development

RUN chmod +x ./wpscan.rb

ENTRYPOINT ["./wpscan.rb"]