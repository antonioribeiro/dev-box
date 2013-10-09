Alias /beanstalkd "{{ webserver_document_root }}/beanstalk_console/public/"

<Directory {{ webserver_document_root }}/beanstalk_console/public/>
  Options Indexes Includes FollowSymLinks MultiViews
  AllowOverride AuthConfig FileInfo
  Order allow,deny
  Allow from all
</Directory>