[Development Box](https://github.com/antonioribeiro/ansible)
============================================================


Configure your Development Box
----------------------------------------------------------------------------------

If you installed Ansible using the install-ansible.sh script, your playbook was cloned to `/etc/dev-box/`, otherwise, make the necessary changes to the file names below.

If you did not used the install-ansible.sh script, you need, first, to copy the default files:

```
cp hosts.default hosts
cp playbook.default.yml playbook.yml
cp group_vars/default-all group_vars/all
```

And edit two of them

## File: hosts 

This is where you set the ip address (or hostname) of your virtual machine:

```
[devbox]
<IP-OR-HOSTNAME>
```

And you can add as many boxes as you want to the list

```
[devbox]
10.0.0.1

[phpbox]
10.0.0.2
```

#### Selecting what to install

You can also use hosts to select what you want installed on your box, by adding or removing the hostname to software sections, for instance, to install Composer, add your hosts to the `composer:children` section:

```
[composer:children]
devbox
phpbox
```

The host `devbox`, default for this playbook, was already added to all sections.

## File: group_vars/all

It contains your personal info (usernames and passwords) for each software you will install and many configuration options for packages:

```
user_with_sudo_power: 'YOUR-BOX-MAIN-USERNAME'

mysql_root_username: $root_username
mysql_root_password: 'PASSWORD'
```

Some variables are preconfigured or using Ansible presets and you just change them if you really need to:

```
server_hostname: '{{ ansible_hostname }}'
```
