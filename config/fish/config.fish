set -x PATH $PATH "$HOME/bin"
set -x PATH $PATH "$HOME/.cargo/bin"

set fish_greeting

set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x EDITOR "nvim"

alias tmux 'tmux -2'
alias ls 'ls -hF --color=auto --group-directories-first'
alias rg "rg -S"
alias gpm 'git push origin master'

function difflines
  git diff --no-index $argv[1] $argv[2]
end

function diffchars
  git diff --color-words=. --no-index $argv[1] $argv[2]
end

function diffwords
  git diff --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+' --no-index $argv[1] $argv[2]
end

function git-ammend-modified
  git add (git diff --name-only); and git commit --amend --no-edit
end

function git-set-upstream-to-master
  git branch --set-upstream-to=origin/master (git rev-parse --abbrev-ref HEAD)
end

function fish_prompt
  set -l last_status $status

  if [ "$last_status" != "0" ]
    echo -n "["
    set_color $fish_color_error
    echo -n $last_status
    set_color normal
    echo -n "] "
  end

  if set -q fish_private_mode
    set_color $fish_color_comment
    echo -n "(p) "
    set_color normal
  end
  echo -n '→ '
end

function fish_right_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    echo -n " "
    set_color normal
end

function eval_ssh_agent
    eval (command ssh-agent -c | sed -E 's/^setenv (.+);$/set \1; set -Ux \1;/')
end

if type -q nvim
    alias vim "nvim"
end

function von
    set dirname (basename (pwd))
    if test -d ./env
        source env/bin/activate.fish
    else if test -n $dirname ;and test -d $HOME/envs/$dirname
        source $HOME/envs/$dirname/bin/activate.fish
    else
        echo "Found no virtualenv"
    end
end

function voff
    deactivate
end

if [ -f "$HOME/.config.local.fish" ]
  source $HOME/.config.local.fish
end
