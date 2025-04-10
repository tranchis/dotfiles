#!/bin/sh

processorBrand=$(/usr/sbin/sysctl -n machdep.cpu.brand_string)
if [[ "${processorBrand}" = *"Apple"* ]]; then
  echo "Apple Processor is present."
  checkRosettaStatus=$(/bin/launchctl list | /usr/bin/grep "com.apple.oahd-root-helper")
  RosettaFolder="/Library/Apple/usr/share/rosetta"
  if [[ -e "${RosettaFolder}" && "${checkRosettaStatus}" != "" ]]; then
    echo "Rosetta Folder exists and Rosetta Service is running. Exiting..."
  else
    echo "Rosetta Folder does not exist or Rosetta service is not running. Installing Rosetta..."
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    if [[ $? -eq 0 ]]; then
      echo "Rosetta installed successfully."
    else
      echo "Rosetta installation failed."
    fi
  fi
else
  echo "Apple Processor is not present. Rosetta not required."
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

pip3 install ansible
brew install ansible

mkdir ~/Applications
mkdir -p ~/repos/
cd ~/repos
git clone https://github.com/tranchis/dotfiles.git

cd dotfiles
ansible-playbook -i inventory macos.yml -K
