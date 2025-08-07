FROM php:8.2-fpm

# Instalar dependências do sistema e extensões PHP necessárias
RUN apt-get update && apt-get install -y \
    git zip unzip libzip-dev libonig-dev libxml2-dev libpng-dev libjpeg-dev libfreetype6-dev libssl-dev libcurl4-openssl-dev libicu-dev libpq-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install pdo pdo_mysql zip mbstring exif pcntl bcmath xml gd intl curl

# Instalar Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm"]
