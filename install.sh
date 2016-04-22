#!/bin/bash
chmod 755 /data
cd /data
wget https://www.dbninja.com/download/dbninja.tar.gz
mkdir /data/www && cd /data/www && rm -rf /var/www && ln /data/www /var/www -s
tar zxf /data/dbninja.tar.gz
chown -R www-data:www-data /data/www
sed -i -e"s/#LogLevel info ssl\:warn/Options \+FollowSymLinks/" /etc/apache2/sites-enabled/000-default.conf
sed -i -e"s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/dbninja/" /etc/apache2/sites-enabled/000-default.conf
sed -i -e"s/upload_max_filesize \= 2M/upload_max_filesize \= 1024M/" /etc/php5/apache2/php.ini
