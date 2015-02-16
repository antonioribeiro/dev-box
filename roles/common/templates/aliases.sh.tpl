#!/bin/bash

############################################################
####
####  Exports
####

export MY_EDITOR={{ default_editor }}
export EDITOR={{ default_editor }}
export TERM=linux
export HISTFILESIZE=50000
export COMPOSER_HOME={{ composer_home }}


############################################################
####
####  Change Directory
####

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'


############################################################
####
####  PHPUnit
####

alias t="clear; phpunit"


############################################################
####
####  Git
####

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
alias gpop='git push origin master:production'
alias gr='git remote'
alias gs='git status'
alias gss='gstatus'
alias gsr='gstatus'
alias gitpl='git log --all --decorate --oneline --graph'

function gaacpm() {
    echo "-------------------------------------------------------"
    echo ":::::: Git add -A"
    git add -A
    echo

    echo "-------------------------------------------------------"
    echo ":::::: Git commit -m $@"
    git commit -m '$@'
    echo

    echo "-------------------------------------------------------"
    echo ":::::: Git push origin master"
    git push origin master
    echo
}

# remove files that are not under version control
alias gcf="git clean -f"

# discard changes in the working directory
alias gcod="git checkout -- ."

# grab the latest upstream version
alias gpum="git pull upstream master"

# delete branch from github. follow with branch name
alias gpod="git push origin --delete"

# show git status without untracked files
alias gsu="git status -uno"

# git hard reset protection
# git()
# {
#     show=yes
#     numeric='^[0-9\.]+$'
#     arguments=$@

#     if [ "$GIT_REMOTE" == "" ] ; then
#         GIT_BRANCH=origin
#     fi

#     if [[ "$1" = "reset" ]] && [ "$2" = "--hard" ] && [ "$3" = "HEAD" ] ; then
#         echo "are you being a moron again? (yes/no)"
#         read i
#         if [ "$i" != "no" ]; then
#             echo "you're safe, reset not executed"
#             return 0
#         fi
#     elif [[ "$1" == "tag" ]] && [ "$2" != "" ] && [[ $2 =~ $numeric ]] && [ "$3" == "" ] ; then
#         echo "is numeric!!!"
#         arguments="tag -a v$2 -m 'version $2'"
#     else
#         show=no
#     fi

#     if [ "$show" == "yes" ] ; then
#         echo "executing: git $arguments..."
#     fi

#     command="command git $arguments; command git push $GIT_REMOTE --tags "

#     eval $command
# }


############################################################
####
####  Git Prompt
####

function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}

function git-branch-prompt {
  local branch=`git-branch-name`
  if [ $branch ]; then printf " [%s]" $branch; fi
}

function currpreviousdir {
   dirname `pwd -P`
}


############################################################
####
####  Date and Time
####

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'


############################################################
####
####  Ping and Ports
####

# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

alias ports='netstat -tulanp'


############################################################
####
####  Filesystem Commands Protection
####

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='sudo rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'


############################################################
####
####  Apt (Debian / Ubuntu)
####

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

############################################################
####
####  Reboot / Shutdown
####

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'


############################################################
####
####  Wget Protection
####

## this one saved by butt so many times ##
alias wget='wget -c'


############################################################
####
####  Pretty disk free and usage
####

## set some other defaults ##
alias df='df -H'
alias du='du -ch'


############################################################
####
####  Top
####

# top is atop, just like vi is vim
#alias top='atop'

# restart service


############################################################
####
####  Restart / Stop / Reload Services
####

function restart()
{
    webguys='web|php5|nginx|apache2';

    if echo "$webguys" | egrep -q "$@"; then
        restartService nginx

        restartService apache2

        restartService php5-fpm php-fpm

        return 0
    fi

    sudo service "$@" restart ;
}

function restartService() {
    if [ "$2" == "" ]; then
        service=$1
    else
        service=$2
    fi

    serviceIsLoaded $service

    if [ $? == 0 ];  then
        sudo service $1 restart
    fi
}

function serviceIsLoaded() {
    SERVICE=$1;

    if ps ax | grep -v grep | grep $SERVICE > /dev/null
    then
        # service is running
        return 0
    else
        return 1
    fi
}

function reload() { sudo service "$@" reload ;}


############################################################
####
####  Print Path
####

# Pretty-print of some PATH variables:

alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


############################################################
####
####  ls - The 'sudo ls' family (this assumes you use a recent GNU ls).
####

alias l='sudo ls -laF --color=auto'

# Add colors for filetype and  human-readable sizes by default on 'sudo ls':
alias ls='sudo ls -h --color'
alias lx='sudo ls -lXB'         #  Sort by extension.
alias lk='sudo ls -lSr'         #  Sort by size, biggest last.
alias lt='sudo ls -ltr'         #  Sort by date, most recent last.
alias lc='sudo ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='sudo ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="sudo ls -lv --group-directories-first"
alias lm='sudo ll |more'        #  Pipe through 'more'
alias lr='sudo ll -R'           #  Recursive ls.
alias la='sudo ll -A'           #  Show hidden files.
alias tree='sudo tree -Csuh'    #  Nice alternative to 'recursive ls' ...

#List only directories
alias lsd='sudo ls -l | grep "^d"'


############################################################
####
####  Spelling typos - highly personal and keyboard-dependent :-)
####

alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'


############################################################
####
####  File & strings related functions:
####

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


############################################################
####
####  MS-DOS aliases
####

alias md='sudo mkdir -p'
alias copy='cp'
alias rd='sudo rmdir'
alias del='sudo rm'
alias cls='clear'
alias dir='l'
alias move='sudo mv'
alias locate='locate -i'

if [ "$EDITOR" == "" ]; then
  alias ed='sudo $MY_EDITOR'
else
  alias ed='sudo $EDITOR'
fi


############################################################
####
####  PHP check
####

# Check PHP For Errors
alias phpcheck='find ./ -name \*.php | xargs -n 1 php -l'


############################################################
####
####  chmod
####

#chmod train
alias mx='sudo chmod a+x'
alias 000='sudo chmod 000'
alias 400='sudo chmod 400'
alias 644='sudo chmod 644'
alias 755='sudo chmod 755'


############################################################
####
####  Show all IPs in the current box
####

alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"


############################################################
####
####  Composer
####

alias cda="composer dump-autoload"
alias cdo="composer dump-autoload --optimize"
alias cu="composer update"
alias cus="composer update --prefer-source"
alias cups="composer update --prefer-source"
alias cud="composer update --prefer-dist"
alias cupd="composer update --prefer-dist"
alias csu="sudo composer self-update"
alias cr="composer require"
alias composer="hhvm {{ composer_executable }}"


############################################################
####
####  Laravel
####

# Tail Laravel and Webserver (NGINX & Apache 2) log files
# Compatible with Laravel 4 & 5
#
alias tl="/bin/ls -d /var/log/nginx/* /var/log/apache2/* storage/logs/* app/storage/logs/* storage/laravel.log | grep -v 'gz$' | grep -v '1$' | xargs tail -f"

##### If you don't have artisan anywhere installed, uncomment the next line
#alias artisan="php artisan"

alias a="artisan"
alias am="artisan migrate"
alias amr="artisan migrate:rollback"
alias ads="artisan db:seed"

# Artisan Migrate Deep
alias amd="artisan migrate:rollback; artisan migrate; artisan db:seed"

function routes()
{
    if [ $# -eq 0 ]; then
        php artisan route:list
    else
        php artisan route:list | grep ${1}
    fi
}


############################################################
####
####  NGINX - From Laravel Forge
####

function serve() {
    if [[ "$1" && "$2" ]]
    then
        sudo dos2unix /etc/scripts/serve.sh
        sudo bash /etc/scripts/serve.sh "$1" "$2"
    else
        echo "Error: missing required parameters."
        echo "Usage: "
        echo "  serve domain path"
    fi
}


############################################################
####
####  Way Laravel4-Generators
####

alias g:m="artisan generate:migration"
alias g:mod="artisan generate:model"
alias g:c="artisan generate:controller"
alias g:v="artisan generate:view"
alias g:s="artisan generate:seed"
alias g:r="artisan generate:resource"


############################################################
####
####  Codeception
####

###### alias codecept="codecept" ##### you may have to set this alias depending on your box
###### running codecept as a non executable script:
######   alias codecept="sh vendor/bin/codecept"
######   also: edit vendor/bin/codecept and add php in front of "$BIN_TARGET" "$@"

alias codecept="sh vendor/bin/codecept"

alias cg="codecept generate:cept"

alias cc="codecept run"

alias cf="cc functional"
alias cfs="cf --steps"
alias cff="cfs"

alias ci="cc integration"
alias cis="ci --steps"
alias cii="cis"

alias pj="phantomjs --webdriver=4444"
alias se="selenium"

############################################################
####
####  System
####

alias temp="sensors"
alias ulimit='ulimit -S'
alias less='less -r'
