FROM webdevops/apache:ubuntu-18.04

LABEL maintainer="Tuan Anh Nguyen <nguyenhuutuananh2@gmail.com>"

ARG FOR_M1=false
RUN if [ ${FOR_M1} = true ]; then wget -O "/usr/local/bin/go-replace" "https://github.com/webdevops/goreplace/releases/download/1.1.2/gr-arm64-linux"; fi
RUN if [ ${FOR_M1} = true ]; then chmod +x "/usr/local/bin/go-replace"; fi
RUN if [ ${FOR_M1} = true ]; then "/usr/local/bin/go-replace" --version; fi

RUN touch /var/log/xdebug.log

ARG DOCUMENT_ROOT=/var/www/
ARG PHP_UPSTREAM_CONTAINER=php-fpm
ARG PHP_UPSTREAM_PORT=9000
ARG PHP_UPSTREAM_TIMEOUT=60
ARG APACHE_INSTALL_HTTP2=false

ENV WEB_PHP_SOCKET=${PHP_UPSTREAM_CONTAINER}:${PHP_UPSTREAM_PORT}
ENV WEB_DOCUMENT_ROOT=${DOCUMENT_ROOT}
ENV WEB_PHP_TIMEOUT=${PHP_UPSTREAM_TIMEOUT}


ENV LOG_STDOUT=/var/log/apache2/access.log
ENV LOG_STDERR=/var/log/apache2/error.log

EXPOSE 80 443

WORKDIR /var/www/

COPY vhost.conf /etc/apache2/sites-enabled/vhost.conf

ADD ./startup.sh /opt/startup.sh

CMD ["/bin/bash", "/opt/startup.sh"]

EXPOSE 80 443
