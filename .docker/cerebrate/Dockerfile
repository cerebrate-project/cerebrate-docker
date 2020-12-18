FROM php:7.2-fpm

LABEL maintainer="Circl Team <info@circl.lu>" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="cerebrate" \
      org.label-schema.description="The Cerebrate Sync Platform core software " \
      org.label-schema.url="https://github.com/cerebrate-project/cerebrate" \
      org.label-schema.vcs-url="https://github.com/cerebrate-project/cerebrate.git" \
      org.label-schema.vendor="cerebrate-project"

EXPOSE 9000
WORKDIR /www

RUN apt-get update && apt-get install -y libxml2-dev curl git zip \
	&& docker-php-ext-install intl pdo pdo_mysql simplexml

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

LABEL org.label-schema.version=$BUILD_VERSION \
	  org.label-schema.build-date=$BUILD_DATE \
	  org.label-schema.vcs-ref=$VCS_REF

COPY ./app/cerebrate /www

RUN mv /www/config/app_local.env.example.php /www/config/app_local.php

RUN composer install

# Map error to docker logs engine
RUN chown -R www-data:www-data /www

USER www-data
