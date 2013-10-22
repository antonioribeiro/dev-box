[Development Box](https://github.com/antonioribeiro/ansible)
============================================================


Deploy your development box
----------------------------------------------------------------------------------

### Create an environment variable pointing to your repository path
```
PLAYBOOKDIR=/etc/dev-box
```

### Run your full playbook

```
ansible-playbook --inventory-file=$PLAYBOOK/hosts.ini $PLAYBOOK/playbook.yml -K
```

Ansible will asks for your sudo password.


### Idempotence

This repository, as Ansible, was creted to be idempotent, so if you break something, you just run the playbook again and it will make your box return at its first state after deployment.


### Executing roles separately

If you need to execute one role (like php or nginx) separately, you can just select the porper tag:

```
ansible-playbook --inventory-file=$PLAYBOOK/hosts.ini $PLAYBOOK/playbook.yml -K --tags=php
```

