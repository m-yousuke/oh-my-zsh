# Yay! High voltage and arrows!
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname 
}

prompt_setup_pygmalion(){
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[red]%}✚%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[cyan]%}✹%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[yellow]%}✖%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[cyan]%}➜%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}═%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}✭%{$reset_color%}"

#  base_prompt='%{$fg[magenta]%}%n%{$reset_color%}%{$fg[cyan]%}@$(box_name)%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%}%{$fg[red]%}:%{$reset_color%}%{$fg[cyan]%}%0~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}'
  base_prompt='\
%{$fg[magenta]%}%n%{$reset_color%}\
%{$fg[cyan]%}@%{$reset_color%}\
%{$fg[yellow]%}$(box_name)%{$reset_color%}\
%{$fg[red]%}:%{$reset_color%}\
%{$fg[cyan]%}%0~%{$reset_color%}\
%{$fg[red]%}|%{$reset_color%}'

  post_prompt='%{$fg[cyan]%}⇒%{$reset_color%}  '

  base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")
  post_prompt_nocolor=$(echo "$post_prompt" | perl -pe "s/%\{[^}]+\}//g")

  add-zsh-hook precmd prompt_pygmalion_precmd
}

prompt_pygmalion_precmd(){
  local gitinfo=$(git_prompt_info)
  local gitinfo_nocolor=$(echo "$gitinfo" | perl -pe "s/%\{[^}]+\}//g")
  local exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  local nl=""

  if [[ $prompt_length -gt 40 ]]; then
    nl=$'\n%{\r%}';
  fi
  PROMPT="$base_prompt$gitinfo$nl$post_prompt"
}

prompt_setup_pygmalion


#rvenv settings
if which rbenv &> /dev/null; then
  RPS1='%{$fg[yellow]%}[%*]%{$reset_color%}%{$fg[red]%}[`rbenv version | sed -e "s/ (set.*$//"`]%{$reset_color%} $EPS1'
fi
