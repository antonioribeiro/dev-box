server {
    listen          80;
    server_name     laravel;

    rewrite ^(.*) http://laravel$1 permanent;
}

server {

    # Document root
    root /var/www/laravel;

    # Try static files first, then php
    index index.html index.htm index.php;

    # Specific logs for this vhost
    access_log /var/log/nginx/laravel-access.log;
    error_log  /var/log/nginx/laravel-error.log error;

    # Make site accessible from http://localhost/
    server_name laravel;

    # Specify a character set
    charset utf-8;

    # h5bp nginx configs
    include conf/h5bp.conf;

    # Redirect needed to "hide" index.php
    location / {
        try_files $uri $uri/ /index.php?q=$uri&$args;
    }

    # Don't log robots.txt or favicon.ico files
    location = /favicon.ico { log_not_found off; access_log off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    # 404 errors handled by our application, for instance Laravel or CodeIgniter
    error_page 404 /index.php;

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini

        # With php5-cgi alone:
        # fastcgi_pass 127.0.0.1:9000;
        # With php5-fpm:
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
    }

    # Deny access to .htaccess
    location ~ /\.ht {
        deny all;
    }        

}

# server {
    # listen 80;
    # listen [::]:80 default_server ipv6only=on;

    # root /usr/share/nginx/html;
    # index index.html index.htm;

    # # Make site accessible from http://localhost/
    # server_name localhost;

    # location / {
    #     # First attempt to serve request as file, then
    #     # as directory, then fall back to displaying a 404.
    #     try_files $uri $uri/ /index.html;
    #     # Uncomment to enable naxsi on this location
    #     # include /etc/nginx/naxsi.rules
    # }

    # location /doc/ {
    #     alias /usr/share/doc/;
    #     autoindex on;
    #     allow 127.0.0.1;
    #     allow ::1;
    #     deny all;
    # }

    # location /RequestDenied {
    #       proxy_pass http://127.0.0.1:8080;
    # }

    # error_page 404 /404.html;

    # redirect server error pages to the static page /50x.html
    
    # error_page 500 502 503 504 /50x.html;
    # location = /50x.html {
    #       root /usr/share/nginx/html;
    # }

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    
    # location ~ \.php$ {
    #       fastcgi_split_path_info ^(.+\.php)(/.+)$;
    #       # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini
    
    #       # With php5-cgi alone:
    #       fastcgi_pass 127.0.0.1:9000;
    #       # With php5-fpm:
    #       fastcgi_pass unix:/var/run/php5-fpm.sock;
    #       fastcgi_index index.php;
    #       include fastcgi_params;
    # }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    
    # location ~ /\.ht {
    #       deny all;
    # }
# }


# another virtual host using mix of IP-, name-, and port-based configuration
#
#server {
#       listen 8000;
#       listen somename:8080;
#       server_name somename alias another.alias;
#       root html;
#       index index.html index.htm;
#
#       location / {
#               try_files $uri $uri/ =404;
#       }
#}


# HTTPS server
#
#server {
#       listen 443;
#       server_name localhost;
#
#       root html;
#       index index.html index.htm;
#
#       ssl on;
#       ssl_certificate cert.pem;
#       ssl_certificate_key cert.key;
#
#       ssl_session_timeout 5m;
#
#       ssl_protocols SSLv3 TLSv1;
#       ssl_ciphers ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv3:+EXP;
#       ssl_prefer_server_ciphers on;
#
#       location / {
#               try_files $uri $uri/ =404;
#       }
#}
