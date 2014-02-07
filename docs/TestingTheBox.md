[Development Box](https://github.com/antonioribeiro/dev-box)
============================================================


Testing Stuff in your Development Box
----------------------------------------------------------------------------------

As soon as you installed it, you can point your browser some addresses:

Check if Laravel site is running:
```
http://<dev-box-ip-or-name>/laravel
```
This will also test a lot of things, like Nginx, PHP-FPM, Mcrypt.


Check if phpmyadmin is running
```
http://<dev-box-ip-or-name>/phpmyadmin
```
It will also tell you if MySQL is installed correctly and if your root user has access to it.

Check if Beanstalkd (server and console) are running:
```
http://<dev-box-ip-or-name>/beanstalk
```

Check your php version:

```
php -v 
```

Check your installed php modules 

```
php -m
```

Execute grunt

```
grunt
```

Execute Redis Commander

```
redis-commander
```

