#!/bin/bash

# Variables according to you Distribution
# [RedHat] var=yum
# [Debian] var=yum
var=yum

$var -y install deltarpm -y
$var  groups install "Development Tools" -y
$var -y install release* -y
$var -y update -y
$var -y upgrade -y

$var -y install ansible

echo "inventory = /etc/ansible/hosts" >> /etc/ansible/ansible.cfg
echo "localhost   ansible_connection=local" >> /etc/ansible/hosts

echo "execution du role de configuration des logiciels du noobs"
sleep 2

#ansible-playbook

ansible-playbook `pwd`/welcome-noobs/tests/test.yml -s
