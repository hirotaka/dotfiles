function chrome-history
    set cols (math $COLUMNS / 3)
    set sep '{::}'
    set -l google_history
    set -l open

    if [ (uname) = Darwin ]
        set google_history "$HOME/Library/Application Support/Google/Chrome/Default/History"
        set open open
    else
        set google_history "$HOME/.config/google-chrome/Default/History"
        set open xdg-open
    end

    cp -f "$google_history" /tmp/h
    sqlite3 -separator $sep /tmp/h "
    select substr(title, 1, $cols), url
    from urls order by last_visit_time desc
  " | awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' | fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open >/dev/null 2>/dev/null
end
