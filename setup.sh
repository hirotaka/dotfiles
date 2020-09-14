#!/bin/bash
set -u

#
# brew
#
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "done"

# packages
echo "Installing brew packages..."
brew install ag
brew install anyenv
brew install git
brew install tmux
brew install zsh
echo "done"

# cask
echo "Installing brew cask packages..."
brew cask install 1password
brew cask install alfred
brew cask install cloudapp
brew cask install discord
brew cask install dropbox
brew cask install fish
brew cask install google-chrome
brew cask install hyperswitch
brew cast install iterm2
brew cask install rectangle
brew cask install slack
echo "done"

# font
echo "Installing font..."
brew tap homebrew/cask-fonts
brew cask install font-ricty-diminished
echo "done"

# emacs
echo "Installing emacs..."
brew tap railwaycat/emacsmacport
brew cask install emacs-mac-spacemacs-icon
echo "done"

# spacemacs
echo "Installing spacemacs..."
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
echo "done"

#
# dotfiles
#
echo "Setting up dotfiles..."
mkdir -p ~/Worspaces/hirotaka
cd ~/Worspaces/hirotaka/dotfiles
git clone git@github.com:hirotaka/dotfiles.git
ln -s ~/Workspace/hirotaka/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Workspace/hirotaka/dotfiles/.spacemacs ~/.spacemacs
ln -s ~/Workspace/hirotaka/dotfiles/.spacemacs.d ~/.spacemacs.d
ln -s ~/Workspace/hirotaka/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Workspace/hirotaka/dotfiles/.config ~/.config

#
# fish
#
echo "Setting up fish..."
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
echo "done"

#
# Atok
#
echo "Download file from https://mypassport.atok.com/install/install_mac.html"
