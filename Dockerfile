FROM httpd:2.4-alpine

LABEL base_image="httpd:2.4-alpine"
LABEL authors="Florentin Munsch <flo.m68@gmail.com>"
LABEL maintainer="Florentin Munsch <flo.m68@gmail.com>"
LABEL company="KMSF"
LABEL website="www.munschflorentin.fr"
LABEL version="1.1"
LABEL date="2026-10-20"
LABEL description="HTTPD 2.4 with common modules and tools for development"
LABEL license="Unlicense"
LABEL repository="https://github.com/Florentin68/docker-httpd"

ENV PORT=80

# Apache modules
RUN apk update && apk add apache-mod-fcgid

# Create directories and update permissions
RUN mkdir -p /var/www /var/log/apache2 \
    && chown -R www-data:www-data /var/www /var/log/apache2 /usr/local/apache2/logs

VOLUME /usr/local/apache2/conf/httpd.conf
VOLUME /usr/local/apache2/conf/extra/httpd-vhosts.conf
VOLUME /var/www
VOLUME /var/log/apache2

WORKDIR /var/www

EXPOSE $PORT

USER www-data:www-data

# Start Apache
CMD ["httpd-foreground"]