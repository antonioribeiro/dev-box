[Development Box](https://github.com/antonioribeiro/ansible)
============================================================


Deploy your development box
----------------------------------------------------------------------------------

# Create an environment variable pointing to your repository path
```
PLAYBOOKDIR=/etc/dev-box
```

# Run your full playbook

```
ansible-playbook --inventory-file=$PLAYBOOK/hosts.ini $PLAYBOOK/playbook.yml -K
```

Ansible will asks for your sudo password.

# Run 