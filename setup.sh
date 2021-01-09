#!/bin/bash
set -u

#
# brew
#
echo "Installing brew..."
if [ ! -f /usr/local/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "brew alread installed"
fi
echo "done"

# packages
echo "Installing brew packages..."
brew install ag
brew install anyenv
brew install cmake
brew install fish
brew install fzf
brew install gh
brew install git
brew install tmux
brew install zsh
brew install libvterm
echo "done"

# cask
echo "Installing brew cask packages..."
brew install --cask 1password
brew install --cask alfred
brew install --cask cloudapp
brew install --cask discord
brew install --cask dropbox
brew install --cask figma
brew install --cask google-chrome
brew install --cask mi
brew install --cask microsoft-office
brew install --cask hyperswitch
brew install --cask iterm2
brew install --cask rectangle
brew install --cask slack
brew install --cask spotify
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
if [ ! -d ~/.emacs.d ]; then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
echo "done"

#
# dotfiles
#
echo "Setting up dotfiles..."
if [ ! -d ~/Worspaces/hirotaka/dotfiles ]; then
    mkdir -p ~/Worspaces/hirotaka
    cd ~/Worspaces/hirotaka
    git clone https://github.com/hirotaka/dotfiles.git
fi
if [ ! -f ~/.spacemacs ]; then
    ln -s ~/Workspaces/hirotaka/dotfiles/.spacemacs ~/.spacemacs
fi
if [ ! -f ~/.tmux.conf ]; then
    ln -s ~/Workspaces/hirotaka/dotfiles/.tmux.conf ~/.tmux.conf
fi
if [ ! -f ~/.config ]; then
    ln -s ~/Workspaces/hirotaka/dotfiles/.config ~/.config
fi

#
# fish
#
echo "Setting up fish..."
if [ $SHELL != '/usr/local/bin/fish' ] && [ ! -f /usr/local/bin/fish ]; then
    echo $(which fish) | sudo tee -a /etc/shells
    chsh -s $(which fish)
    echo "done"
else
    echo "fish is already setted up or could not find fish"
fi

#
# Atok
#
echo "Download file from https://mypassport.atok.com/install/install_mac.html"
