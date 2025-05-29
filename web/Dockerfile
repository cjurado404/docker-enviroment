FROM php:8.3-apache

ENV APACHE_DOCUMENT_ROOT=/var/www/html/demo/public

# Instalar dependencias básicas y extensiones PHP necesarias
RUN apt-get update && apt-get install -y \
    git unzip zip curl wget gnupg libzip-dev libicu-dev libonig-dev libxml2-dev \
    && docker-php-ext-install zip intl pdo pdo_mysql

# 🐘 Instalar Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Configurar Xdebug para desarrollo (puedes personalizar más)
RUN echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.log_level=0" >> /usr/local/etc/php/conf.d/xdebug.ini

# 🧪 Instalar PHPUnit manualmente (última versión compatible con PHP 8.3)
RUN wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-10.phar && \
    chmod +x /usr/local/bin/phpunit

# 🧰 Instalar Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony*/bin/symfony /usr/local/bin/symfony

# 🧵 Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Activar rewrite en Apache
RUN a2enmod rewrite

# Ajustar la raíz del documento en Apache
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && \
    sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copiar entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html/demo
ENTRYPOINT ["/entrypoint.sh"]
