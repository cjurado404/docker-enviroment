FROM php:8.3-apache

# Arguments to specify Symfony version and project name
ARG SYMFONY_VERSION=6.4
ARG PROJECT=my_project
ENV SYMFONY_VERSION=${SYMFONY_VERSION}
ENV PROJECT=${PROJECT}

# Install dependencies and Composer
RUN apt-get update \
    && apt-get install -y git unzip zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /var/lib/apt/lists/*

# Install Symfony skeleton in the Apache document root using PROJECT name
RUN composer create-project symfony/skeleton:"${SYMFONY_VERSION}" /var/www/html/${PROJECT}

RUN a2enmod rewrite

WORKDIR /var/www/html/${PROJECT}
