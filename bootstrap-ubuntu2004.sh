#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install ansible

ansible-galaxy collection install community.general
ansible-playbook -K -i inventory ubuntu-2004-amd.yml

