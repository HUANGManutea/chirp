FROM dwchiang/nginx-php-fpm:8.2.12-fpm-bookworm-nginx-1.25.2

COPY . /var/www/html

# Install Composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# Install PHP dependencies
RUN cd /var/www/html && composer install --no-dev --optimize-autoloader