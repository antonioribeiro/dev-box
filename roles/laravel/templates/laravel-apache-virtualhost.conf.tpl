Alias {{ laravel_root_url }} "{{ laravel_document_root }}/public"

<Directory {{ laravel_document_root }}/public>
    Options Indexes Includes FollowSymLinks MultiViews
    DirectoryIndex index.php
    AllowOverride AuthConfig FileInfo
    Order allow,deny
    Allow from all
</Directory>
