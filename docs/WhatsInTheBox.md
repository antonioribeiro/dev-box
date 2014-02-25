[dev-box](https://github.com/antonioribeiro/dev-box)
============================================================


Here's a complete list of what's installed in your box
----------------------------------------------------------------------------------

### Aliases

If you want to use the * [aliases](https://github.com/antonioribeiro/dev-box/blob/master/roles/common/templates/aliases.sh.tpl) provided by the box, you need to source the aliases.sh file:

```
source /etc/scripts/aliases.sh
```

Here's some examples of what you'll find on it:

git add
`ga`

git add -A
`gaa`

git branch
`gb`

git commit -m 
`gc`

git commit -a
`gca`

git commit -a -m
`gcam`

git commit -e
`gce`

git commit -m
`gcm`

git checkout
`gco`

git diff
`gd`

git diff --cached
`gdc`

git push origin master
`gpom`

git remote
`gr`

git status
`gs`



### Apache 2

Packages
- apache2
- libapache2-mod-php5

Modules
- rewrite
- headers
- vhost_alias
- expires


### Beanstalkd

Packages
- beanstalkd

Interfaces
- beanstalk_console

Working on 
- NGINX
- Apache 2

### Supervisor 


### Linux

Packages
- alien
- apt-file
- atop
- build-essential
- bzip2
- debconf-utils
- expect
- g++ 
- git
- git-core
- irssi
- jfsutils
- joe
- less
- libterm-readkey-perl
- libxml2-dev 
- libxslt1-dev
- links
- locate
- lsof
- lynx
- make
- mc
- nmap
- openssl
- p7zip-full
- patch
- psmisc
- python
- python-apt
- python-dev
- python-keyczar
- python-pip
- python-pycurl
- python-software-properties
- rdate
- rsync
- socat
- sshpass
- sshpass
- subversion
- sudo
- telnet
- tmux
- tree
- unzip 
- vim
- zip
- rar 


### Composer

Composer is installed as a standalone app, so you can just call it from anywhere:

```
composer dump-autoload
```


### Docker

It's not installed by default, but you can enable installation in your hosts file.


### Grunt

NPM Packages
- gunt-cli 

Grunt is not really installed, because it must, in fact, installed per project, so go to your project folder and type:

```
npm install grunt@0.4.1 -g
```


### Laravel

Installed from the [Laravel PHP Framework Github Main Repository](https://github.com/laravel/laravel).

Just access it using `http://<ip-of-your-box>/laravel`.


### Memcached

Packages
- memcached

### MySQL

Packages
- mysql-server
- mysql-client
- python-mysqldb
- php5-mysql

MySQL is accessible from your workstation IP address, so you can use a program Sequel Pro or Navicat to manage your databases.

### NGINX

Packages
- nginx

Security files:
- https://github.com/h5bp/server-configs-nginx

### Node.JS

It is installed from the binaries: http://nodejs.org/dist/

### PHP

PHP 5.4 is available to Ubuntu 12.04 and 13.04

PHP 5.5 is available to Ubuntu 12.04, 13.04 and 13.10

Packages:
- php5
- php5-cli
- php-apc
- php-pear
- php-xml-parser
- php5-apcu
- php5-cgi
- php5-common
- php5-curl
- php5-dev
- php5-geoip
- php5-imagick
- php5-ldap
- php5-mcrypt
- php5-memcached
- php5-pgsql
- php5-xdebug
- php5-xmlrpc
- php5-fpm
- php5-json
- libmagickwand-dev
- php-gettext

Third party software configured
- XDebug
- APC
- Imagick
- Browserscap: http://tempdownloads.browserscap.com/stream.asp?PHP_BrowsCapINI

PHP-FPM is configured and used with NGINX.


### phpMyAdmin

Packages
- phpmyadmin

Working on 
- NGINX
- Apache 2

### PHPUnit

Installed from sources using Composer. It is installed as a standalone app and you can run it from anywhere.

To update it you just have to 

    sudo composer --working-dir=/usr/share/phpunit update

### PhpSpec

Installed from sources using Composer. It is installed as a standalone app and you can run it from anywhere.

To update it you just have to 

    sudo composer --working-dir=/usr/share/phpspec update

### PostgreSQL

Packages
- postgresql
- postgresql-9.1
- postgresql-doc-9.1
- postgresql-client-9.1
- postgresql-9.1-pgmemcache
- python-psycopg2
- postgresql-doc
- slony1-2-bin
- php5-pgsql
- libpq-dev

PostgreSQL is accessible from your workstation IP address, so you can use a program Sequel Pro or Navicat to manage your databases.


### Python Fabric

Installed using pip.


### Redis

Packages
- redis-server
- redis-doc

Redis Commander is installed using npm and you can just run it using the command line:

```
redis-commander
```

