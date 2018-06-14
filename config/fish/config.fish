set fish_greeting

set -x FZF_DEFAULT_COMMAND "rg --files"
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

alias tmux "tmux -2"

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

if type -q nvim 2> /dev/null
    alias vim "nvim"
end
