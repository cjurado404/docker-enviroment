FROM php:8.3-apache


# Configurable arguments

ARG SYMFONY_VERSION=6.4
ARG PROJECT=my_project
ENV SYMFONY_VERSION=${SYMFONY_VERSION}
ENV PROJECT=${PROJECT}
ENV APACHE_DOCUMENT_ROOT=/var/www/html/${PROJECT}/public

# Install dependencies and Composer
RUN apt-get update \
    && apt-get install -y git unzip zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /var/lib/apt/lists/*


RUN a2enmod rewrite

# Configure Apache document root
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html
ENTRYPOINT ["/entrypoint.sh"]

# Install Symfony skeleton in the Apache document root using PROJECT name
RUN composer create-project symfony/skeleton:"${SYMFONY_VERSION}" /var/www/html/${PROJECT}

RUN a2enmod rewrite

WORKDIR /var/www/html/${PROJECT}
