#!/bin/bash
set -u

# brew
echo "Installing brew..."
if [ ! -f /opt/homebrew/bin/brew ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
	echo "brew already installed"
fi
echo "done"

# setup brew
(
	echo
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# packages
echo "Installing brew packages..."
brew install ag
brew install asdf
brew install cmake
brew install fd
brew install fish
brew install fzf
brew install gawk
brew install gh
brew install ghq
brew install git
brew install gpg
brew install knqyf263/pet/pet
brew install lazygit
brew install ncurses
brew install rg
brew install starship
brew install zellij
brew install highlight
brew install nvim
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install 1password-cli
echo "done"

# obsolete
# brew install smug
# brew install tmux

# start services
yabai --start-service
skhd --start-service

# cask
echo "Installing brew cask packages..."
brew install --cask 1password
brew install --cask alt-tab
brew install --cask cleanshot
brew install --cask discord
brew install --cask docker
brew install --cask figma
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask karabiner-elements
brew install --cask microsoft-office
brew install --cask raycast
brew install --cask slack
brew install --cask spotify
brew install --cask wezterm
echo "done"

# obsolete
# brew install --cask iterm2
# brew install --cask rectangle

# cask-fonts
brew tap homebrew/cask-fonts
brew install --cask font-sauce-code-pro-nerd-font
brew install font-plemol-jp-nf

# emacs
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-native-comp --with-xwidgets --with-spacemacs-icon --with-imagemagick
