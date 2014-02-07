[dev-box](https://github.com/antonioribeiro/dev-box)
============================================================


Installing the Operating System
----------------------------------------------------------------------------------

* Download [Ubuntu](http://www.ubuntu.com/download/server) (Server, preferably)
* Create a virtual machine on Virtualbox and give it 2GB of memory and 4 processors
* Install Ubuntu selecting OpenSSH Server (if asked)
* Do not forget the username (let's call it <box-username>) you first created, it will be used all along this deploy
* Get the ip-address of your box. Execute the following command and take note of the 'inet addr:' number of the eth0 interface:

```
sudo ifconfig 
```

* Make sure you can ping your box:


```
ping <ipaddress>
```

* Make sure you can ssh to your box:

```
ssh <box-username>@<ipaddress>
```

* If you cannot ssh to your box, check if OpenSSH is installed

```
dpkg -l | grep openssh-server | grep -v grep
```

* If you see nothing, install OpenSSH:

```
sudo apt-get update
sudo apt-get install openssh-server
```
