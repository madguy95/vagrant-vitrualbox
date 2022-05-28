#!/bin/bash

IPS=("10.1.38.180" "10.1.38.181" "10.1.38.182")
username="vagrant"
for ip in ${IPS[@]}; do
    echo $username@$ip
    ssh-copy-id -i ~/.ssh/id_rsa.pub $username@$ip
done