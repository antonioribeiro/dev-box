#!/bin/bash

export MY_EDITOR=vim
export TERM=linux                 
export HISTFILESIZE=50000         

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# PHPUnit

alias t="clear; phpunit"

# git

alias ga='git add'
alias gaa='git add -A'
alias gaac="git add -A; git commit -m "
alias gb='git branch'
alias gc='git commit -m '
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gce='git commit -e'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gpom='git push origin master'
alias gr='git remote'
alias gs='git status'

# date and time

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

alias ports='netstat -tulanp'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## Distro specific

# Debian / Ubuntu

alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"
alias ag="sudo apt-get"
alias agi="sudo apt-get install"
alias agiy="sudo apt-get --yes install"
alias agu="sudo apt-get update"
alias acs="sudo apt-cache search"
alias ags=acs                          # sometimes apt-get search is just easier to remember :)
alias acsh='sudo apt-cache show'
alias afs='sudo apt-file show'
alias afl='sudo apt-file list'
alias upgrade='sudo apt-get update && sudo apt-get upgrade'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

## this one saved by butt so many times ##
alias wget='wget -c'

## set some other defaults ##
alias df='df -H'
alias du='du -ch'

# top is atop, just like vi is vim
#alias top='atop'

# restart service

function restart() { sudo service "$@" restart ;}
function reload() { sudo service "$@" reload ;}

# Pretty-print of some PATH variables:

alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------

alias l='ls -laF --color=auto'

# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

#-------------------------------------------------------------
# Spelling typos - highly personnal and keyboard-dependent :-)
#-------------------------------------------------------------

alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'

#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
    OPTIND=1
    local mycase=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
           i) mycase="-i " ;;
           *) echo "$usage"; return ;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more

}


function swap()
{ # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}

# MS-DOS aliases

alias md='mkdir -p'
alias copy='cp'
alias rd='rmdir'
alias del='rm'
alias cls='clear'
alias dir='l'
alias move='mv'
alias locate='locate -i'

if [ "$EDITOR" == "" ]; then
  alias ed='$MY_EDITOR'
else
  alias ed='$EDITOR'
fi

# Check PHP For Errors
alias phpcheck='find ./ -name \*.php | xargs -n 1 php -l'

#chmod train
alias mx='sudo chmod a+x'
alias 000='sudo chmod 000'
alias 400='sudo chmod 400'
alias 644='sudo chmod 644'
alias 755='sudo chmod 755'

#List only directories
alias lsd='ls -l | grep "^d"'

#Show all IPs
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

#composer aliases
alias cda="composer dump-autoload"
alias cdo="composer dump-autoload --optimize"
alias cu="composer update"
alias cus="composer update --prefer-source"
alias cud="composer update --prefer-dist"
alias csu="sudo composer self-update"
alias cr="composer require"
