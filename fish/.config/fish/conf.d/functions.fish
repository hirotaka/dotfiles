### Git
function gacp
    git add -A && git commit -m $argv && git push origin $(git branch | sed -n -e "s/^\* \(.*\)/\1/p")
end

function gadd
    set selected (unbuffer git status -s | fzf -m --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
    if test -n "$selected"
        git add $selected
        echo "Completed: git add $selected"
    end
end

### Vim
function camelcase
    perl -pe 's#(_|^)(.)#\u$2#g'
end

function snakecase
    perl -pe 's#([A-Z])#_\L$1#g' | perl -pe 's#^_##'
end


# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
function fif
    # Check if at least one argument is provided
    if test (count $argv) -eq 0
        echo "Need a string to search for!"
        return 1
    end

    # Use ripgrep to find files with matches for the specified string
    # Pipe the results to fzf for interactive selection
    rg --files-with-matches --no-messages $argv[1] | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$argv[1]' || rg --ignore-case --pretty --context 10 '$argv[1]' {}"
end
