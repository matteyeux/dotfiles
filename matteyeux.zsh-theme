# matteyeux.zsh-theme

# original credits : 
# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

local ret_status="%(?:%{$fg_bold[green]%}λ :%{$fg_bold[red]%}λ )" 

# primary prompt
PROMPT='${ret_status}$FG[032]%~\
$(git_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

RPROMPT=''

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
