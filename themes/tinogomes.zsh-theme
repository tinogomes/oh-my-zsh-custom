# tinogomes theme: Inspired over dst theme

# This theme shows rvm_prompt and git_prompt or hg_prompt.

# Format:
# [date time] <login>@<host>:<pwd> <rvm_prompt> <git_prompt><hg_prompt>
# $ _
#
# You can see a screenshot at
# http://tinogomes.files.wordpress.com/2012/01/screen-shot-2012-01-28-at-15-09-00.png

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
    if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

function prompt_hg_info {
	hg branch >/dev/null 2>/dev/null && echo " %{$fg[green]%}($(hg branch))%{$reset_color%}" && return
	echo ""
}

function prompt_kube_info {
  kube_ps1 > /dev/null 2>/dev/null && echo " $(kube_ps1)" && return
  echo ""
}

#RVM settings
local RVM_PROMPT=''

if [[ -s ~/.rvm/scripts/rvm ]] ; then
    RVM_PROMPT='%{$fg[cyan]%}$(rvm_prompt_info)%{$reset_color%}'
fi

date_prompt="%{$fg[white]%}[%{$fg[yellow]%}%D %T%{$fg[white]%}]%{$reset_color%}"
user_prompt="%{$fg[yellow]%}%n%{$reset_color%}"
hostname_prompt="%{$fg[cyan]%}%m%{$reset_color%}"
directory_prompt="%{$fg[white]%}%~%{$reset_color%}"

PROMPT='
'$RVM_PROMPT'$(git_prompt_info)$(prompt_hg_info)$(prompt_kube_info)
$date_prompt $user_prompt@$hostname_prompt:$directory_prompt
%_$(prompt_char) '
