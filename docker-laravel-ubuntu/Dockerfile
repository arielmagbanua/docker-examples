FROM ubuntu:18.04

# This image doesn't have mysql and redis. Since it would be a good practice to have them as independent images where containers can use them.

# Install Server Dependencies
RUN apt-get update && apt-get install -y apt-utils locales software-properties-common && rm -rf /var/lib/apt/lists/* \
     && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && add-apt-repository universe \
     && apt-get update && apt-get install -y php-fpm php-mysql curl zip unzip nano php-cli php-mbstring git

RUN apt-get install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
     && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
     && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
     && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
     && rm -f /tmp/composer-setup.*

# Install Laravel Dependencies
RUN apt-get install -y supervisor nodejs npm dos2unix \
     && npm install yarn -g

WORKDIR /var/www

COPY ./ ./

RUN dos2unix install.sh

# RUN npm install
CMD ./install.sh
