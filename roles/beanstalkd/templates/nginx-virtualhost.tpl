location /beanstalk {

    root {{ webserver_document_root }}/beanstalk_console; 

    access_log /var/log/nginx/beanstalkd-access.log;
    error_log  /var/log/nginx/beanstalkd-error.log debug;

    index index.php index.html index.htm;

    location ~ ^/beanstalk/(.+\.php)$ {
        try_files $uri =404;
        fastcgi_pass              unix:/var/run/php5-fpm.sock;
        fastcgi_index             index.php;
        fastcgi_split_path_info   ^(.+\.php)(.*)$;
        include                   {{ nginx_config_directory }}/fastcgi_params;
        fastcgi_param             SCRIPT_FILENAME $document_root$fastcgi_script_name;            
    }

    location ~* ^/beanstalk/(.+\.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt))$ {
        root {{ webserver_document_root }}/beanstalk_console;
    }
    
}

location /beanstalkd {
    rewrite ^/* /beanstalk last;
}

location /beanstalk_console {
    rewrite ^/* /beanstalk last;
}
