#!/bin/sh

sudo apt-get install -y zsh wget gconf2 gconf-service libappindicator1
sudo apt-get --fix-broken install -y

cd /tmp
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf ~/.local/share/fonts/
sudo fc-cache -vf ~/.local/share/fonts/
sudo mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
cd -

fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d ${fonts_dir} ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p ${fonts_dir}
else
    echo "Found fonts dir $fonts_dir"
fi

for type in Bold Light Medium Regular Retina; do
    file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
    file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
    if [ ! -e ${file_path} ]; then
        echo "wget -O $file_path $file_url"
        wget -O ${file_path} ${file_url}
    else
	echo "Found existing file $file_path"
    fi;
done

echo "fc-cache -f"
fc-cache -f

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

rm -f ~/.zshrc
ln -s `pwd`/zshrc ~/.zshrc
rm -f ~/.hyper.js
ln -s `pwd`/hyper.js ~/.hyper.js

cd /tmp
wget https://releases.hyper.is/download/deb
sudo dpkg -i deb
cd -
