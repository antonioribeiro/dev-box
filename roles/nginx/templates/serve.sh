#!/usr/bin/env bash

# Extracted from Laravel Homestead
#
# Copyright © Taylor Otwell
#
# https://github.com/laravel/homestead/blob/master/scripts/serve.sh
#

block="server {
    listen 80;
    server_name $1;
    root $2;

    index index.html index.htm index.php;

    charset utf-8;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log /var/log/nginx/$1-access.log combined;
    error_log  /var/log/nginx/$1-error.log error;

    error_page 404 /index.php;

    sendfile off;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }

    include {{ nginx_config_directory }}/h5bp/basic.conf;
}
"

echo "$block" > "/etc/nginx/sites-available/$1"
ln -fs "/etc/nginx/sites-available/$1" "/etc/nginx/sites-enabled/$1"
echo "127.0.0.1 $1" | tee -a /etc/hosts
service nginx restart
service php5-fpm restart