if [[ -n $SSH_CONNECTION ]]; then
    PROMPT="%{$fg[red]%}%n%{$fg[green]%}@%{$fg[yellow]%}%M"
elif [[ $HOSTNAME = toolbox ]]; then
    PROMPT="%{$fg[yellow]%}@%{$fg[red]%}%M"
else
    PROMPT="%{$fg[green]%}"
fi
PROMPT+=' %{$fg[cyan]%}%~%{$reset_color%} '
PROMPT+='%{$fg[red]%}>%{$reset_color%}>%{$fg[green]%}> '

# right prompt
#RPS1+=' $my_gray%n@%m%{$reset_color%}%'
RPS1+='%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})" 
