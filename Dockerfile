FROM ubuntu:20.04

# Install packages and PHP 7
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt-get upgrade -y && \
    apt-get install -y software-properties-common && \ 
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
	apt update -qy && apt-get upgrade -qy && \
	apt-get install -qqy  git \
	#Installing mod-php installs both recommended PHP 7 and Apache2
	libapache2-mod-php \
	composer \
	php-intl \
	php-xml \
	unzip \
	php-ldap \ 
	php-sqlite3 \
	php-mbstring \
	sqlite \
	php-mysql &&\
	# Delete all the apt list files since they're big and get stale quickly
	rm -rf /var/lib/apt/lists/*

	
RUN mkdir /var/www/cerebrate
COPY app /var/www/cerebrate
WORKDIR /var/www/cerebrate
RUN composer install -n

RUN chown www-data:www-data /var/www/cerebrate

# create your local configuration and set the database credentials
RUN cp -a /var/www/cerebrate/config/app_local.example.php /var/www/cerebrate/config/app_local.php

# mod_rewrite needs to be enabled:
RUN a2enmod rewrite

# modify the Datasource -> default array's username, password, database fields This would be, 
# when following the steps above:
#########################################################
#    'Datasources' => [
#         'default' => [
#             'host' => 'database',
#             'username' => 'cerebrate',
#             'password' => 'YOUR_PASSWORD',
#             'database' => 'cerebrate',
#########################################################
RUN sed -i "s|'host' => 'localhost',|'host' => 'database', |g" /var/www/cerebrate/config/app_local.php
RUN sed -i "s|'username' => 'my_app',|'username' => 'cerebrate', |g" /var/www/cerebrate/config/app_local.php
RUN sed -i "s|'password' => 'secret',|'password' => 'YOUR_PASSWORD', |g" \
    /var/www/cerebrate/config/app_local.php
RUN sed -i "s|'database' => 'my_app',|'database' => 'cerebrate', |g" /var/www/cerebrate/config/app_local.php

## Create an apache config file for cerebrate / ssh key 
## and point the document root to /var/www/cerebrate/webroot/index.php and you're good to go


# This configuration is purely meant for local installations for development / testing
# Using HTTP on an unhardened apache is by no means meant to be used in any production environment
RUN cp /var/www/cerebrate/INSTALL/cerebrate_dev.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/cerebrate_dev.conf /etc/apache2/sites-enabled/

RUN service apache2 restart

####################################################
# Expose port and run Apache webserver             #
####################################################

EXPOSE 8000
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]