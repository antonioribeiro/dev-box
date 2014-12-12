[dev-box](https://github.com/antonioribeiro/dev-box)
============================================================

An Ubuntu Development Box Provisioner in [Ansible](http://www.ansibleworks.com/docs/intro_installation.html).
----------------------------------------------------------------------------------

This set Ansible of roles are made to install a complete development Linux box with services and tools focused on [PHP](http://php.net/) and [Composer Packages](https://getcomposer.org/), but it can easily be extended.

Every single role is optional, you can select what you need to install, per box, in your hosts file.

### What's In The Box?

* [NGINX](http://nginx.org/) (default)
* [NGINX Server Configs](https://github.com/h5bp/server-configs-nginx)
* [Apache 2](http://httpd.apache.org/)
* [PHP](http://php.net/) (5.4, 5.5 or 5.6)
* [HHVM](http://hhvm.com/) & Hack
* [Composer](http://getcomposer.org/)
* [Laravel](http://laravel.com/) (Installer & 1st site available at `http://laravel.dev`)
* [Artisan Anywhere](https://github.com/antonioribeiro/artisan-anywhere)
* [PHPUnit](https://github.com/sebastianbergmann/phpunit)
* [PhpSpec](https://github.com/phpspec/phpspec)
* [Codeception](https://github.com/codeception/codeception)
* [Selenium + Firefox](https://code.google.com/p/selenium/)
* [PhantomJS](http://phantomjs.org/)
* [XDebug](http://xdebug.org/)
* [Memcached](http://memcached.org/)
* [Redis](http://redis.io/) + [Redis Commander](https://github.com/nearinfinity/redis-commander)
* [PostgreSQL](http://www.postgresql.org/)
* [phpPgAdmin](http://phppgadmin.sourceforge.net/doku.php)
* [MySQL](http://www.mysql.com/)
* [phpMyAdmin](http://www.phpmyadmin.net/)
* [Beanstalkd](http://kr.github.io/beanstalkd/) + [Beanstalkd Console](https://github.com/ptrofimov/beanstalk_console)
* [Supervisor](http://supervisord.org/) ([supervisor docs](/docs/apps/supervisor.md))
* [NodeJS](http://nodejs.org/)
* [gulp.js](http://gulpjs.com/)
* [Bower](http://bower.io/)
* [Grunt](http://gruntjs.com/)
* [Fabric](http://fabfile.org/)
* [Docker](http://www.docker.io/)
* [xhgui](https://github.com/perftools/xhgui)
* [Bittorrent Sync](http://www.bittorrent.com/sync/)
* [Oracle Java](https://www.oracle.com/java/)
* [Webmin](http://www.webmin.com/)
* [Squid Cache](http://www.squid-cache.org/)
* [ZSH](http://www.zsh.org/)
* [PHP-CS-Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)
* [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)
* [A huge set of aliases](https://github.com/antonioribeiro/dev-box/blob/master/roles/common/templates/aliases.sh.tpl)
* [Linux Swap Memory](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-12-04)

### Requirements

* Ubuntu (tested on 14.04)
* Ansible 1.7+


### Installing

1. [Install Ansible](/docs/InstallAnsible.md) locally on your Workstation
2. [Clone this repository](/docs/CloneRepository.md)
3. Install [Virtualbox](https://www.virtualbox.org/) or any other virtualization system
4. [Install Ubuntu on a Virtual Machine](/docs/InstallOS.md)
5. [Configure packages, usernames and passwords](/docs/ConfigurePlaybook.md)
6. [Create and/or copy a SSH Key to the box](/docs/CopySSHKey.md)
7. [Deploy your development box](/docs/DeployBox.md)
8. [Test your stuff](/docs/DeployBox.md)


### Installation Time

The estimated installation time for a virtual machine with 3000MB of memory and 4 processors, running Ubuntu Server 13.10 under an Intel Core i7 960:

**~16 minutes**


### Realy, what's In The Box? TL;DR

[Here's a complete list of what's installed in your box](/docs/WhatsInTheBox.md)


### Contributing

Pull requests and issues are more than welcome.