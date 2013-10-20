server {

    listen       {{ ansible_default_ipv4.address }}:80;

    server_name  "";   ## this is an IP address (or wrong server_name) based server

    location /phpmyadmin {

        root /usr/share/;

        index index.php index.html index.htm;

        location ~ ^/phpmyadmin/(.+\.php)$ {
            try_files $uri =404;
            fastcgi_pass              unix:/var/run/php5-fpm.sock;
            fastcgi_index             index.php;
            fastcgi_split_path_info   ^(.+\.php)(.*)$;
            include                   {{ nginx_config_directory }}/fastcgi_params;
            fastcgi_param             SCRIPT_FILENAME $document_root$fastcgi_script_name;            
        }

        location ~* ^/phpmyadmin/(.+\.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt))$ {
            root /usr/share/;
        }

    }

    location /phpMyAdmin {
           rewrite ^/* /phpmyadmin last;
    }

}