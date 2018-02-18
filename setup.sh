#!/bin/sh 

set -x #echo on

FOLDER=`pwd`

cd /tmp
if [ ! -d FiraCode ] ; then
	git clone https://github.com/tonsky/FiraCode.git 
fi
cd FiraCode
git pull
cd distr/ttf
cp * ~/Library/Fonts

cd $FOLDER

osascript <<EOD
tell application "Terminal"
	local allOpenedWindows
	local initialOpenedWindows
	local windowID
	set themeName to "Zenburn"
	set initialOpenedWindows to id of every window
	do shell script "open '" & themeName & ".terminal'"
	delay 1
	(*
	set default settings to settings set themeName
	set allOpenedWindows to id of every window
	repeat with windowID in allOpenedWindows
		if initialOpenedWindows does not contain windowID then
			close (every window whose id is windowID)
		else
			set current settings of tabs of (every window whose id is windowID) to settings set themeName
		end if
	end repeat
	*)
end tell
EOD

cd $FOLDER
cp .zshrc ~
cp .spacemacs ~
cp .gitconfig ~
cp .tmux.conf ~

if ! [ -x "/usr/local/bin/brew" ] ; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew bundle
if ! grep -q .usr.local.bin.zsh /etc/shells; then
	echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
fi
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /usr/local/bin/zsh

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

if [ ! -d "/Applications/Emacs.app/" ]; then
	curl -L https://emacsformacosx.com/emacs-builds/Emacs-25.3-universal.dmg > /tmp/emacs.dmg
	hdiutil attach /tmp/emacs.dmg
	cp -R /Volumes/Emacs/Emacs.app /Applications/
	hdiutil unmount /Volumes/Emacs
fi

cd
if [ ! -f "./.emacs.d/spacemacs.mk" ]; then
	rm -fR ~/.emacs.d
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
cd ~/.emacs.d/
git pull

if [ ! -d "/Applications/Adobe Creative Cloud/" ]; then
	open "/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app"
fi

if [ ! -d "/Applications/Battle.net.app/" ]; then
	open "/usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app"
fi

cd
if [ ! -d "Dropbox/" ]; then
	open "/Applications/Dropbox.app"
fi

# https://github.com/arrelid/preferences/blob/master/defaults.sh
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
