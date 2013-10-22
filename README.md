[Development Box](https://github.com/antonioribeiro/ansible)
============================================================


A Set of [Ansible](http://www.ansibleworks.com/docs/intro_installation.html) Roles and Playbooks to deploy an Ubuntu Based Development System.
----------------------------------------------------------------------------------

This system is currently PHP and **Laravel** focused, but it can easily be extended.


### What's In The Box?

* PHP (5.5 or 5.4)
* [Composer](http://getcomposer.org/)
* [Laravel](http://laravel.com/) (a running site)
* [Artisan Anywhere](https://github.com/antonioribeiro/artisan-anywhere)
* [PHPUnit](https://github.com/sebastianbergmann/phpunit)
* [XDebug](http://xdebug.org/)
* NGINX (default) or Apache 2
* [Memcached](http://memcached.org/)
* [Redis](http://redis.io/) + [Redis Commander](https://github.com/nearinfinity/redis-commander)
* Postgres + phpPgAdmin
* MySQL + phpMyAdmin
* [Beanstalkd](http://kr.github.io/beanstalkd/) + [Beanstalkd Console](https://github.com/ptrofimov/beanstalk_console)
* [NodeJS](http://nodejs.org/)
* [Grunt](http://gruntjs.com/)
* [Fabric](http://fabfile.org/)
* [Docker](http://www.docker.io/) (optional)
* [A nice list of aliases](https://github.com/antonioribeiro/dev-box/blob/master/roles/common/templates/aliases.sh.tpl)

### Requirements

* Ubuntu (tested on 12.04, 13.04 and 13.10)
* Ansible 1.3+


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