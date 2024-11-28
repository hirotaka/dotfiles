# https://qiita.com/hennin/items/33758226a0de8c963ddf
set -U FZF_LEGACY_KEYBINDINGS 0

# oh-my-fish/theme-bobthefish
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_display_ruby no
# set -g theme_color_scheme dracula
# set -g theme_color_scheme nord
# set -g theme_color_scheme terminal2-dark-black

# anyenv
# set -x PATH ~/.anyenv/bin $PATH
# set -Ux fish_user_paths ~/.anyenv/bin $fish_user_paths
# anyenv init --no-rehash - fish | source
# source ~/.config/fish/anyenv-rc.fish

# PATH
fish_add_path ~/.docker/bin
fish_add_path ~/.config/nvim/bin

# grep
fish_add_path /opt/homebrew/opt/grep/libexec/gnubin

# grep
fish_add_path /opt/homebrew/opt/gnu-sed/libexec/gnubin

# git-fuzzy
fish_add_path /Users/hirotaka/Workspaces/github.com/bigH/git-fuzzy/bin

# brew
if test -e /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if test -e /usr/local/bin/brew
    eval (/usr/local/bin/brew shellenv)
end

# asdf
# if test -e /opt/homebrew/opt/asdf/libexec/asdf.fish
#     source /opt/homebrew/opt/asdf/libexec/asdf.fish
# else if test -e /usr/local/opt/asdf/libexec/asdf.fish
#     source /usr/local/opt/asdf/libexec/asdf.fish
# end

# mise (asdf alternative)
# mise activate fish | source

# rust
# set -Ux fish_user_paths ~/.cargo/bin $fish_user_paths

# lvim
# set -Ux fish_user_paths ~/.local/bin $fish_user_paths

# For Japanese
set -xg LESSCHARSET utf-8
set -xg LC_ALL ja_JP.UTF-8
set -xg LANG ja_JP.UTF-8
set -xg LC_MESSAGES ja_JP.UTF-8

# Neovim
set -xg EDITOR nvim

# for mode in default insert visual
#     fish_default_key_bindings -M $mode
# end
# fish_vi_key_bindings --no-erase
# fish_vi_key_bindings
fish_hybrid_key_bindings

# peco setting
# set fish_plugins theme peco

# doom
set -Ux fish_user_paths ~/.emacs.d/bin $fish_user_paths

# 1password
# source /Users/hirotaka/.config/op/plugins.sh

# starship
starship init fish | source

# abbrs
source ~/.config/fish/conf.d/abbrv.fish

# functions
source ~/.config/fish/conf.d/functions.fish

# keybindings
for mode in default insert
    # pet
    bind -M $mode \cs pet-select
    # git
    bind -M $mode \cb fzf_git_recent_branch
    # https://www.reddit.com/r/fishshell/comments/kk62hx/how_to_expand_an_abbreviation_without_a_space_at/
    bind -M $mode \cg expand-abbr
end

# haskell
fish_add_path /opt/homebrew/opt/llvm/bin
set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /Users/hirotaka/.ghcup/bin # ghcup-env

# Set the normal and visual mode cursors to a block
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block
set fish_vi_force_cursor 1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /opt/anaconda3/bin/conda
#     eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
#         . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/opt/anaconda3/bin" $PATH
#     end
# end
# <<< conda initialize <<<

# zoxide
zoxide init fish | source

# modules
source $HOMEBREW_PREFIX/opt/modules/init/fish
module use ~/.config/modulefiles
/Users/hirotaka/.local/bin/mise activate fish | source
