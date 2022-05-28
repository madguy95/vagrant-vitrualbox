# Vagrant Ubuntu VitrualBox

The first, let's change some info in vagrantFile

IP_PUB : ip prefix for public network

IP_PRV : ip prefix for private network

Run 
```sh
vagrant up
```

Generate ssh key by keygen
```sh
ssh-keygen -t rsa -b 4096
```

Copy publickey to all VM
```sh
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@ip
```

You can connect to vm by username and password default is vagrant / vagrant
or
run 
```sh
vagrant ssh kmaster
```