FROM barbudo/ruby


ADD . /wweb

RUN /wweb/install.sh && rm -rf /wweb

USER app

RUN cd ~ && git clone https://github.com/urbanadventurer/WhatWeb.git WhatWeb
WORKDIR /home/app/WhatWeb


ENTRYPOINT ["./whatweb"]