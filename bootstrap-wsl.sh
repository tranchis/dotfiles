#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install bzip2 libffi libxml2 libxmlsec1 openssl readline sqlite xz zlib gcc

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install ansible

ansible-playbook -K -i inventory wsl.yml

