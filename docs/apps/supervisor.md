[dev-box](https://github.com/antonioribeiro/dev-box)
============================================================


Using Supervisor
----------------------------------------------------------------------------------

Start supervisor console

```
sudo supervisorctl 
```

Execute the `reread` command, it will scan and identify your conf files

```
supervisor> reread
```

It should respond:

```
laravel: available
```

Add your laravel program to the process group

```
supervisor> add laravel
```

Every time you need to start this program you just have to

```
supervisor> start laravel
```

But if you run it now it should say

```
already started
```
