# Dockerfile
FROM php:7.3-apache

# Meta
LABEL author="Fabio Y. Goto <lab@yuiti.dev>"

# Activate mod_rewrite
RUN a2enmod rewrite

# APT Bonanza
RUN apt-get update -y \
  && apt-get install -y \
    libbz2-dev \
    libc-client-dev \ 
    libcurl3-dev \
    libedit-dev \ 
    libenchant-dev \
    libfreetype6-dev \
    libgmp-dev \ 
    libicu-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libkrb5-dev \
    libldap2-dev \ 
    libldb-dev \
    libmcrypt-dev \
    libpng-dev \
    libpspell-dev \ 
    libreadline-dev \
    libtidy-dev \ 
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    libzzip-dev \ 
    mariadb-server \ 
    nano \ 
    sendmail

# Remove lists for IMAP
RUN rm -r rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
  && ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so

# PHP Extension Bonanza
RUN docker-php-ext-install bcmath \ 
  && docker-php-ext-install bz2 \ 
  && docker-php-ext-install calendar \ 
  && docker-php-ext-install dba \ 
  && docker-php-ext-install enchant \ 
  && docker-php-ext-install exif \ 
  && docker-php-ext-install gd \ 
  && docker-php-ext-install gettext \ 
  && docker-php-ext-install gmp \ 
  && docker-php-ext-configure imap \
    --with-kerberos \
    --with-imap-ssl \ 
  && docker-php-ext-install imap \
  && docker-php-ext-install intl \
  && docker-php-ext-configure ldap \
    --with-libdir=lib/x86_64-linux-gnu \
  && docker-php-ext-install ldap \ 
  && docker-php-ext-install mysqli \ 
  && docker-php-ext-install pcntl \ 
  && docker-php-ext-install pdo_mysql \ 
  && docker-php-ext-install pspell \ 
  && docker-php-ext-install readline \ 
  && docker-php-ext-install shmop \ 
  && docker-php-ext-install soap \ 
  && docker-php-ext-install sockets \ 
  && docker-php-ext-install sysvmsg \ 
  && docker-php-ext-install sysvsem \ 
  && docker-php-ext-install sysvshm \ 
  && docker-php-ext-install tidy \ 
  && docker-php-ext-install wddx \ 
  && docker-php-ext-install xmlrpc \ 
  && docker-php-ext-install xsl \ 
  && docker-php-ext-install zip
