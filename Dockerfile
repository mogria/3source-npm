FROM node:latest

MAINTAINER "Mogria" <m0gr14@gmail.com>

ENV RUN_AS 0

COPY toolscript.sh /usr/bin/toolscript.sh
COPY container-user.sh /usr/bin/container-user.sh
COPY umask-wrapper.sh /usr/bin/umask-wrapper.sh

RUN wget -O /usr/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)" && \
    chmod +x /usr/bin/gosu && \
    chmod +x /usr/bin/toolscript.sh && \
    chmod +x /usr/bin/container-user.sh && \
    chmod +x /usr/bin/umask-wrapper.sh

RUN npm install -g bower gulp

VOLUME ["/data"]

WORKDIR /data/www

ENTRYPOINT ["umask-wrapper.sh", "container-user.sh", "toolscript.sh"]
CMD ["npm"]
