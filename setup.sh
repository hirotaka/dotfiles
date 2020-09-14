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
brew install cmake
brew install fish
brew install git
brew install tmux
brew install zsh
brew install libvterm
echo "done"

# cask
echo "Installing brew cask packages..."
brew cask install 1password
brew cask install alfred
brew cask install cloudapp
brew cask install discord
brew cask install dropbox
brew cask install google-chrome
brew cask install hyperswitch
brew cask install iterm2
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
cd ~/Worspaces/hirotaka
git clone https://github.com/hirotaka/dotfiles.git
if [ ! -f ~/Workspace/hirotaka/dotfiles/.gitconfig ]; then
    ln -s ~/Workspace/hirotaka/dotfiles/.gitconfig ~/.gitconfig
fi
if [ ! -f ~/Workspace/hirotaka/dotfiles/.spacemacs ]; then
    ln -s ~/Workspace/hirotaka/dotfiles/.spacemacs ~/.spacemacs
fi
if [ ! -f ~/Workspace/hirotaka/dotfiles/.tmux.conf ]; then
    ln -s ~/Workspace/hirotaka/dotfiles/.tmux.conf ~/.tmux.conf
fi
if [ ! -f ~/Workspace/hirotaka/dotfiles/.config ]; then
    ln -s ~/Workspace/hirotaka/dotfiles/.config ~/.config
fi

#
# fish
#
echo "Setting up fish..."
if [[ $SHELL != '/usr/bin/local/fish' && -f /usr/local/bin/fish ]]; then
    echo $(which fish) | sudo tee -a /etc/shells
    chsh -s $(which fish)
    echo "done"
else
    echo "Could not find fish"
fi

#
# Atok
#
echo "Download file from https://mypassport.atok.com/install/install_mac.html"
