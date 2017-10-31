# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
user-complete(){
    if [[ -n $BUFFER ]] ; then     # 如果该行有内容
        zle expand-or-complete    # 执行 TAB 原来的功能
    else                                  # 如果没有
        BUFFER="cd "                 # 填入 cd（空格）
        zle end-of-line                # 这时光标在行首，移动到行末
        zle expand-or-complete    # 执行 TAB 原来的功能
    fi
}
zle -N user-complete
bindkey "\t" user-complete        #将上面的功能绑定到 TAB 键
bindkey '\C-f' forward-word
bindkey '\C-b' backward-word
bindkey '\C-n' backward-kill-word
