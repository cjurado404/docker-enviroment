FROM php:8.3-apache


# Install Symfony 6.4 in project "demo"
ENV APACHE_DOCUMENT_ROOT=/var/www/html/demo/public

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

# Install Symfony skeleton in the Apache document root
RUN composer create-project symfony/skeleton:"6.4" /var/www/html/demo

RUN a2enmod rewrite

WORKDIR /var/www/html/demo
