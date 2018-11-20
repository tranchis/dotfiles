#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install ansible

ansible-playbook -i inventory wsl.yml

