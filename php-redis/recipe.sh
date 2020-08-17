# Install the Redis extension from PECL
sudo pecl install redis

# Figure out the PHP MAJOR.MINOR version
php_version=`php -r "echo PHP_MAJOR_VERSION . '.' . PHP_MINOR_VERSION;"`

# Register and enable the PHP extension
echo 'extension=redis.so' | sudo tee "/etc/php/${php_version}/mods-available/redis.ini"
sudo phpenmod redis

# Restart PHP-FPM and nginx, just to be on the safe side
sudo service "php${php_version}-fpm" restart
sudo service nginx restart