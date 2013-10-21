location ~ ^{{ laravel_site_base_url }}(/?.*)$ {

    access_log /var/log/nginx{{ laravel_site_base_url }}-access.log;
    error_log  /var/log/nginx{{ laravel_site_base_url }}-error.log debug;

    root {{ webserver_document_root }}{{ laravel_site_base_url }}/public/;

    index public/index.php index.php;

    try_files  $uri $1 /index.php =404;

    location ~ ^.+\.php(/.*)? {
	    try_files  $uri $1 /index.php =404;

        fastcgi_pass              unix:/var/run/php5-fpm.sock;
        fastcgi_index             index.php;
        fastcgi_split_path_info   ^(.+\.php)(.*)$;
        include                   {{ nginx_config_directory }}/fastcgi_params;
        fastcgi_param             SCRIPT_FILENAME {{ webserver_document_root }}{{ laravel_site_base_url }}/public/index.php;
        fastcgi_param             REQUEST_URI $1;
    }

    location ~ ^{{ laravel_site_base_url }}(/?.*)$ {
	    try_files  $uri $1 /index.php =404;

        fastcgi_pass              unix:/var/run/php5-fpm.sock;
        fastcgi_index             index.php;
        fastcgi_split_path_info   ^(.+\.php)(.*)$;
        include                   {{ nginx_config_directory }}/fastcgi_params;
        fastcgi_param             SCRIPT_FILENAME {{ webserver_document_root }}{{ laravel_site_base_url }}/public/index.php;
        fastcgi_param             REQUEST_URI $1;
    }

}
