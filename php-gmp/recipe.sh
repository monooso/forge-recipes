sudo apt update

# This automatically installs the correct extension for your version of PHP
#
# It also creates `/etc/php/7.3/mods-available/gmp.ini`, and symlinks it to:
# - `/etc/php/{version}/cli/conf.d/gmp.ini`
# - `/etc/php/{version}/fpm/conf.d/gmp.ini`
sudo apt install -y php-gmp

# Figure out the correct PHP-FPM service name
fpm_service=`php -r "echo 'php' . PHP_MAJOR_VERSION . '.' . PHP_MINOR_VERSION . '-fpm';"`

# Restart PHP-FPM and nginx, just to be on the safe side
sudo service $fpm_service restart
sudo service nginx restart