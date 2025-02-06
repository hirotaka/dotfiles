#!/usr/bin/env fish

abbr ze zellij
abbr zel 'zellij ls'
abbr zea 'zellij attach'

function zellij_new_session
    set -l dir $argv[1]

    z $dir

    set -l session (string replace '/' '-' $dir)

    if test (count $argv) -ge 3
        set session $argv[3]
    end

    set -l pattern (string join "$session" '[^-]')
    if zellij ls | strip-ansi-escapes | grep -E "$pattern"
        zellij attach $session
    else
        zellij --session $session --new-session-with-layout $argv[2]
    end
end

alias zen zellij_new_session
