PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"

#PROMPT+=' $(git_prompt_info)'
PROMPT+=' $(git_prompt_info)%(!.#) '
PROMPT+='${DOCKER_CONTAINER_NAME:+[Docker: $DOCKER_CONTAINER_NAME]}'


# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}git:(%{$fg[white]%}"  # Magenta for git prefix
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} %{$fg[cyan]%}╰→%{$reset_color%} "

