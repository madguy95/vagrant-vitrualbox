#!/bin/bash

# Update hosts file
# echo "[TASK 1] Update /etc/hosts file"
# cat >>/etc/hosts<<EOF
# 172.42.42.100 kmaster.example.com kmaster
# 172.42.42.101 kworker1.example.com kworker1
# 172.42.42.102 kworker2.example.com kworker2
# EOF

# Disable SELinux (Security-Enhanced Linux) là một mô đun bảo mật ở nhân của Linux
echo "[TASK 4] Disable SELinux"
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

# Stop and disable firewalld
echo "[TASK 5] Stop and Disable firewalld"
systemctl disable firewalld >/dev/null 2>&1
systemctl stop firewalld

# Enable ssh password authentication
echo "[TASK 11] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Set Root password
echo "[TASK 12] Set root password"
echo "kubeadmin" | passwd --stdin root >/dev/null 2>&1

# Update vagrant user's bashrc file
echo "export TERM=xterm" >> /etc/bashrc
