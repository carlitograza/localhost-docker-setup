# Use the PHP 8.4 Apache image (latest PHP version as of December 2024)
FROM php:8.4-apache

# Copy custom php.ini from the config folder to the container
COPY ./config/php.ini /usr/local/etc/php/

# Change the document root to the php folder
RUN sed -i 's|/var/www/html|/var/www/php|' /etc/apache2/sites-available/000-default.conf
RUN sed -i 's|/var/www/html|/var/www/php|' /etc/apache2/apache2.conf

# Enable mod_rewrite (if needed)
RUN a2enmod rewrite
