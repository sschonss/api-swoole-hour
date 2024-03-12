FROM php:8.1-cli

RUN apt-get update \
    && apt-get install -y libonig-dev \
    && docker-php-ext-install -j$(nproc) pdo_mysql bcmath mbstring \
    && pecl install swoole \
    && docker-php-ext-enable swoole

WORKDIR /app

COPY ./src /app

CMD ["php", "/app/index.php"]
