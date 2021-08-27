FROM php:7.4-apache

#Update
RUN apt-get update

RUN apt-get install -y \
    unzip \
    vim

RUN docker-php-ext-enable opcache
RUN docker-php-ext-install calendar
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install tokenizer
RUN docker-php-ext-install json

RUN apt-get install -y \
    libonig-dev \
    && docker-php-ext-install iconv mbstring

RUN apt-get install -y \
    libcurl4-openssl-dev \
    && docker-php-ext-install curl

RUN apt-get install -y \
    libssl-dev \
    && docker-php-ext-install ftp phar

RUN apt-get install -y \
    libicu-dev \
    && docker-php-ext-install intl

RUN apt-get install -y \
    libmcrypt-dev \
    && docker-php-ext-install session

RUN apt-get install -y \
    libxml2-dev \
    && docker-php-ext-install simplexml xml xmlrpc

RUN apt-get install -y \
    libzip-dev \
    zlib1g-dev \
    && docker-php-ext-install zip

RUN apt-get install -y \
    libgmp-dev \
    && docker-php-ext-install gmp

RUN apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y libmagickwand-dev
RUN pecl install imagick && docker-php-ext-enable imagick

#Update 
RUN apt-get update

#Install FFmpeg
RUN apt-get install ffmpeg -y

#Check FFmpeg version
RUN ffmpeg -version

#Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Print Composer version
RUN composer --version
