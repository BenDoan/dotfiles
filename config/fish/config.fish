set fish_greeting

set -x FZF_DEFAULT_COMMAND "rg --files"
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

function fish_prompt
    echo -n '→ '
end

function fish_right_prompt -d "Write out the right prompt"
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
end


