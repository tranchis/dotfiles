#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install ansible

bash <(curl -s https://gist.githubusercontent.com/alokyadav15/c3a2bbe6089ceff286215113bd092703/raw/3a3dd9af2ec59e4756bee5282e7c1e714dbf7db2/setup_fonts.sh)

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $($(brew --prefix)/bin/brew shellenv)

ansible-galaxy collection install community.general
ansible-playbook -K -i inventory ubuntu-2010.yml
