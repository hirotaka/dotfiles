alias fzc="git branch --list | cut -c 3- | fzf --preview \"git log --pretty=format:'%h %cd %s' --date=format:'%Y-%m-%d %H:%M' {}\" | xargs git checkout"
alias nvimdiff="nvim -d"
