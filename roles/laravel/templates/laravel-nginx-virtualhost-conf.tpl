server {

    listen       {{ ansible_default_ipv4.address }}:80;

    server_name  "";   ## this is an IP address (or wrong server_name) based server

    location ~ ^{{ laravel_site_base_url }}(/?(.*))$ {

        # URLs to attempt, including pretty ones.
        try_files   $uri /index.php?$2;

        root {{ webserver_document_root }}{{ laravel_site_base_url }}/public/;

        access_log /var/log/nginx{{ laravel_site_base_url }}-access.log;
        error_log  /var/log/nginx{{ laravel_site_base_url }}-error.log error;

    }

    rewrite ^/(.*)/$ /$1 permanent;

    location ~ \.php$ {
        fastcgi_pass              unix:/var/run/php5-fpm.sock;
        fastcgi_index             index.php;
        fastcgi_split_path_info   ^(.+\.php)(.*)$;
        include                   {{ nginx_config_directory }}/fastcgi_params;
        fastcgi_param             SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    # We don't need .ht files with nginx.
    location ~ /\.ht {
        deny all;
    }

    # Set header expirations on per-project basis
    location ~* \.(?:ico|css|js|jpe?g|JPE?G|png|svg|woff|webp)$ {

        expires max;

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
