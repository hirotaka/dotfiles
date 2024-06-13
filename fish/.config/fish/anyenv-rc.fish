source "/usr/local/Cellar/anyenv/1.1.4/libexec/../completions/anyenv.fish"
function anyenv
  set command $argv[1]
  set -e argv[1]

  command anyenv "$command" $argv
end
set -gx GOENV_ROOT "/Users/hirotaka/.anyenv/envs/goenv"
set -gx PATH $PATH "/Users/hirotaka/.anyenv/envs/goenv/bin"
set -gx GOENV_SHELL fish
set -gx GOENV_ROOT /Users/hirotaka/.anyenv/envs/goenv
if not contains $GOENV_ROOT/shims $PATH
  set -gx PATH $GOENV_ROOT/shims $PATH
end
source '/Users/hirotaka/.anyenv/envs/goenv/libexec/../completions/goenv.fish'
command goenv rehash 2>/dev/null
function goenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (goenv "sh-$command" $argv|psub)
  case '*'
    command goenv "$command" $argv
  end
end
goenv rehash --only-manage-paths
set -gx JENV_ROOT "/Users/hirotaka/.anyenv/envs/jenv"
set -gx PATH $PATH "/Users/hirotaka/.anyenv/envs/jenv/bin"
set -gx PATH '/Users/hirotaka/.anyenv/envs/jenv/shims' $PATH
set -gx JENV_SHELL fish
set -gx JENV_LOADED 1
set -e JAVA_HOME
set -e JDK_HOME
source '/Users/hirotaka/.anyenv/envs/jenv/libexec/../completions/jenv.fish'
jenv rehash 2>/dev/null
jenv refresh-plugins
function jenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case enable-plugin rehash shell shell-options
    jenv "sh-$command" $argv | source
  case '*'
    command jenv "$command" $argv
  end
end
set -gx NODENV_ROOT "/Users/hirotaka/.anyenv/envs/nodenv"
set -gx PATH $PATH "/Users/hirotaka/.anyenv/envs/nodenv/bin"
set -gx PATH '/Users/hirotaka/.anyenv/envs/nodenv/shims' $PATH
set -gx NODENV_SHELL fish
source '/Users/hirotaka/.anyenv/envs/nodenv/libexec/../completions/nodenv.fish'
command nodenv rehash 2>/dev/null
function nodenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (nodenv "sh-$command" $argv|psub)
  case '*'
    command nodenv "$command" $argv
  end
end
set -gx PYENV_ROOT "/Users/hirotaka/.anyenv/envs/pyenv"
set -gx PATH $PATH "/Users/hirotaka/.anyenv/envs/pyenv/bin"
while set pyenv_index (contains -i -- "/Users/hirotaka/.anyenv/envs/pyenv/shims" $PATH)
set -eg PATH[$pyenv_index]; end; set -e pyenv_index
set -gx PATH '/Users/hirotaka/.anyenv/envs/pyenv/shims' $PATH
command pyenv rehash 2>/dev/null
while set pyenv_index (contains -i -- "/Users/hirotaka/.anyenv/envs/pyenv/shims" $PATH)
set -eg PATH[$pyenv_index]; end; set -e pyenv_index
set -gx PATH '/Users/hirotaka/.anyenv/envs/pyenv/shims' $PATH
set -gx PYENV_SHELL fish
source '/Users/hirotaka/.anyenv/envs/pyenv/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end
set -gx RBENV_ROOT "/Users/hirotaka/.anyenv/envs/rbenv"
set -gx PATH $PATH "/Users/hirotaka/.anyenv/envs/rbenv/bin"
set -gx PATH '/Users/hirotaka/.anyenv/envs/rbenv/shims' $PATH
set -gx RBENV_SHELL fish
command rbenv rehash 2>/dev/null
function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    rbenv "sh-$command" $argv|source
  case '*'
    command rbenv "$command" $argv
  end
end
