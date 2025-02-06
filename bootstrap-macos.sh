#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

pip3 install ansible
brew install ansible

mkdir -p ~/repos/
cd ~/repos
git clone https://github.com/tranchis/dotfiles.git

cd dotfiles
ansible-playbook -i inventory macos.yml -K
