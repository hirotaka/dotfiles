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
) >>/Users/hirotaka/.zprofile
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
brew install lazygit
brew install ncurses
brew install pet
brew install rg
brew install smug
brew install tmux
echo "done"

# cask
echo "Installing brew cask packages..."
brew install --cask 1password
brew install --cask alfred
brew install --cask alt-tab
brew install --cask cleanshot
brew install --cask discord
brew install --cask docker
brew install --cask figma
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask microsoft-office
brew install --cask rectangle
brew install --cask slack
brew install --cask spotify
echo "done"

# cask-fonts
brew tap homebrew/cask-fonts
brew install --cask font-sauce-code-pro-nerd-font

# dotfiles
echo "Setting up dotfiles..."
if [ ! -d ~/Workspaces/github.com/hirotaka/dotfiles ]; then
	mkdir -p ~/Workspaces/github.com/hirotaka
	cd ~/Workspaces/github.com/hirotaka
	git clone git@github.com:hirotaka/dotfiles.git
fi
if [ ! -f ~/.tmux.conf ]; then
	ln -s ~/Workspaces/github.com/hirotaka/dotfiles/.tmux.conf ~/.tmux.conf
fi
if [ ! -f ~/.config ]; then
	ln -s ~/Workspaces/github.com/hirotaka/dotfiles/.config ~/.config
fi

# asdf
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

# fish
echo "Setting up fish..."
if [ $SHELL != '/usr/local/bin/fish' ] && [ ! -f /usr/local/bin/fish ]; then
	echo $(which fish) | sudo tee -a /etc/shells
	chsh -s $(which fish)
	echo "done"
else
	echo "fish is already setted up or could not find fish"
fi

# Atok
echo "Download file from https://mypassport.atok.com/install/install_mac.html"

# terminfo
# /opt/homebrew/opt/ncurses/bin/infocmp tmux-256color > ~/tmux-256color.info
# tic -xe tmux-256color ~/.config/tmux/tmux-256color.info

# ssh-agent
# ssh-add --apple-use-keychain ~/.ssh/id_rsa
