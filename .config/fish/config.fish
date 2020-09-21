# https://qiita.com/hennin/items/33758226a0de8c963ddf
set -U FZF_LEGACY_KEYBINDINGS 0

# oh-my-fish/theme-bobthefish
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_color_scheme terminal2-dark-white

# anyenv
set -x PATH ~/.anyenv/bin $PATH
anyenv init - fish | source

set -U EDITOR vim
