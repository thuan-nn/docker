FROM grafana/k6:latest

USER root

WORKDIR /var/www/

COPY script.js /var/www/script.js

ENTRYPOINT [ "k6 run script.js" ]

EXPOSE 3000