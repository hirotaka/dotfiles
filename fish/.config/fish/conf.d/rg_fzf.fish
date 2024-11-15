function rg_fzf
    rm -f /tmp/rg-fzf-{r,f}
    set RG_PREFIX "rg --column --line-number --no-heading --color=always --smart-case "
    set INITIAL_QUERY "$argv"

    fzf --ansi --disabled --query "$INITIAL_QUERY" \
        --bind "start:reload:$RG_PREFIX {q}" \
        --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
        --bind 'ctrl-r:transform:if not string match -q "*ripgrep*" $FZF_PROMPT;
            echo "rebind(change)+change-prompt(1. ripgrep> )+disable-search+transform-query:echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r";
            else;
            echo "unbind(change)+change-prompt(2. fzf> )+enable-search+transform-query:echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f";
            end' \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --prompt '1. ripgrep> ' \
        --delimiter : \
        --header 'CTRL-R: Switch between ripgrep/fzf' \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --bind 'enter:become(nvim {1} +{2})'
end
