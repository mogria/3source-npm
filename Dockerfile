FROM node:latest

MAINTAINER "Mogria" <m0gr14@gmail.com>

COPY toolscript.sh /usr/bin/toolscript.sh
RUN chmod +x /usr/bin/toolscript.sh
COPY umask-wrapper.sh /usr/bin/umask-wrapper.sh

RUN npm install -g bower gulp

RUN mkdir -p /var/www && \
    chown -R www-data:www-data /var/www

VOLUME ["/data"]

WORKDIR /data/www
USER www-data

ENTRYPOINT ["umask-wrapper.sh", "toolscript.sh"]
CMD ["npm"]
