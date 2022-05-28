#!/bin/bash

# Update hosts file
# echo "[TASK 1] Update /etc/hosts file"
# cat >>/etc/hosts<<EOF
# 10.1.38.180 kmaster.example.com kmaster
# 10.1.38.181 kworker1.example.com kworker1
# 10.1.38.182 kworker2.example.com kworker2
# EOF

# echo "===== update package ====="
# apt-get update -y

# echo "===== Installing openssh ====="
# apt update
# apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# apt install -y openssh-server
# systemctl enable ssh
# Enable ssh password authentication
echo "[TASK 11] Enable ssh password authentication"
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Set Root password
echo "[TASK 12] Set root password"
echo -e "kubeadmin\nkubeadmin" | passwd root
#echo "kubeadmin" | passwd --stdin root >/dev/null 2>&1

# Update vagrant user's bashrc file
echo "export TERM=xterm" >> /etc/bashrc
