set fish_greeting

set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

alias tmux 'tmux -2'
alias ls 'ls -hF --color=auto --group-directories-first'
alias rg "rg -S"
alias gpm 'git push origin master'

function difflines
  git diff --no-index $1 $2
end

function diffchars
  git diff --color-words=. --no-index $1 $2
end

function diffwords
  git diff --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+' --no-index $1 $2
end

function git-ammend-modified
  git add (git diff --name-only); and git commit --amend --no-edit
end

function fish_prompt
  set -l last_status $status

  if [ "$last_status" != "0" ]
    echo -n "[$last_status] "
  end
    echo -n '→ '
end

function fish_right_prompt -d "Write out the right prompt"
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    echo -n " "
    set_color normal
end
#
# Turn virtualenvs on/off
function von
    set dirname (basename (pwd))
    if [[ -n $dirname && -d $HOME/envs/$dirname ]]; then
        source $HOME/envs/$dirname/bin/activate
    end
end
function voff
  deactivate
end

if type -q nvim
    alias vim "nvim"
end
