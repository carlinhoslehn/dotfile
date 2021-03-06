#!/bin/bash

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi
# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'


# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

alias dc='docker-compose '
alias sy='php bin/console '
alias dcu='dc up -d'
alias project='cd ~/Project/'

# Usado para iniciar o Php Server para o symfony
function server(){ sy server:$1; }

# Utilizado para clonar repositorios do gitlab interno
# Já iniciando  o git flow

function gitclone() {
  com_porta=$(echo $1 | sed "s/:/:8990\//g");
  git clone 'ssh://'$com_porta $2;
  cd $2
  git flow init
}

function porta() {
 sudo -v
 echo "$(sudo netstat -tlpn | grep $1)";
}

function dump-env()
{
 composer dump-env $1;
}

# GIT FLOW ALIASES

alias gfi="git flow init"
gcf()  { git checkout feature/$1; }
gffs() { git flow feature start $1; }
gfff() { git flow feature finish -F $(git_flow_current_branch); }

gcr()  { git checkout release/$1;  }
gfrs() { git flow release start $1; }
gfrf() { git flow release finish -F $(git_flow_current_branch); }
git_flow_current_branch(){ git rev-parse --abbrev-ref HEAD | cut -d'/' -f 2; }
