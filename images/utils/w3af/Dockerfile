FROM m0sth8/base

USER root

RUN apt-get install -y libyaml-dev python-pip

RUN pip install clamd==1.0.1 PyGithub==1.21.0 GitPython==0.3.2.RC1 pybloomfiltermmap==0.3.11 esmre==0.3.1 nltk==2.0.4 chardet==2.1.1 pdfminer==20110515 futures==2.1.5 pyOpenSSL==0.13.1 lxml==2.3.2 scapy-real==2.2.0-dev guess-language==0.2 cluster==1.1.1b3 msgpack-python==0.2.4 python-ntlm==1.0.1 halberd==0.2.4 && rm -rf /tmp/pip-build-root
RUN pip install --ignore-installed git+https://github.com/andresriancho/phply.git#egg=phply && rm -rf /tmp/pip-build-root

USER app
WORKDIR /home/app
RUN git clone --depth 1 https://github.com/andresriancho/w3af.git
WORKDIR /home/app/w3af

ENTRYPOINT ["./w3af_console"]
