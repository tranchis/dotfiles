#!/bin/sh

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
	set themeName to "Zenburn" (* Set the name of the theme*)
	(* Store the IDs of all the open terminal windows. *)
	set initialOpenedWindows to id of every window
	(* Open the custom theme so that it gets added to the list
	   of available terminal themes (note: this will open two
	   additional terminal windows). *)
	do shell script "open '" & themeName & ".terminal'"
	(* Wait a little bit to ensure that the custom theme is added. *)
	delay 1
	(* Set the custom theme as the default terminal theme. *)
	set default settings to settings set themeName
	(* Get the IDs of all the currently opened terminal windows. *)
	set allOpenedWindows to id of every window
	repeat with windowID in allOpenedWindows
		(* Close the additional windows that were opened in order
		   to add the custom theme to the list of terminal themes. *)
		if initialOpenedWindows does not contain windowID then
			close (every window whose id is windowID)
		(* Change the theme for the initial opened terminal windows
		   to remove the need to close them in order for the custom
		   theme to be applied. *)
		else
			set current settings of tabs of (every window whose id is windowID) to settings set themeName
		end if
	end repeat
end tell
EOD

cd $FOLDER
cp .zshrc ~

if [ -x "brew" ] ; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew install zsh zsh-completions zsh-autosuggestions
if ! grep -q .usr.local.bin.zsh /etc/shells; then
	echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
fi
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /usr/local/bin/zsh

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi


