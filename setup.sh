#!/bin/bash
set -u

# dotfiles
echo "Setting up dotfiles..."
if [ ! -d ~/Workspaces/github.com/hirotaka/dotfiles ]; then
	mkdir -p ~/Workspaces/github.com/hirotaka
	cd ~/Workspaces/github.com/hirotaka || exit
	git clone git@github.com:hirotaka/dotfiles.git

	# stow
	stow doom -t "$HOME"
	stow emacs -t "$HOME"
	stow fish -t "$HOME"
	stow git -t "$HOME"
	stow karabiner -t "$HOME"
	stow nvim -t "$HOME"
	stow op -t "$HOME"
	stow pet -t "$HOME"
	stow raycast -t "$HOME"
	stow skhd -t "$HOME"
	stow starship -t "$HOME"
	stow wezterm -t "$HOME"
	stow yabai -t "$HOME"
	stow zellij -t "$HOME"
fi
echo "done"

# fish
echo "Setting up fish..."
if [ $SHELL != '/usr/local/bin/fish' ] && [ ! -f /usr/local/bin/fish ]; then
	echo $(which fish) | sudo tee -a /etc/shells
	chsh -s $(which fish)
	echo "done"
else
	echo "fish is already setted up or could not find fish"
fi

# asdf
echo "Setting up asdf..."
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
echo "done"
