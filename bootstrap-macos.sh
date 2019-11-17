#!/bin/sh

touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" --verbose;

echo | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

pip3 install ansible
brew install ansible

mkdir -p ~/repos/
cd ~/repos
git clone https://github.com/tranchis/dotfiles.git

cd dotfiles
ansible-playbook -i inventory macos.yml -K
