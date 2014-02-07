[Development Box](https://github.com/antonioribeiro/dev-box)
============================================================


Copy your SSH key to the development box
----------------------------------------------------------------------------------

SSH Key is used to login on SSH without a password, so you need to have one on your workstation and copy it to the /home/<box-username>/.ssh/authorized_keys on your development box.

* Check if you have a RSA key on your workstation:

```
ls -la ~/.ssh/id_rsa*
```

* If you don't have a key, create one

```
ssh-keygen -t rsa -f ~/.ssh/id_rsa -C "name@yourmailprovider.tld"
```

* Use the ssh-copy-id program to copy your key, provided by the package openssh-client:

```
ssh-copy-id <box-username>@<ip-address>
```

* Or you can copy it using SSH:

```
cat ~/.ssh/id_rsa.pub | ssh -l <box-username> <box-ipaddress> 'mkdir -p /home/<box-username>/<box-ipaddress> >> /home/<box-username>/<box-ipaddress>```
```
