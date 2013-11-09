#!/bin/bash

export TERM=linux                 
export HISTFILESIZE=50000         
alias l='sudo ls -laF --color=auto'
alias md='sudo mkdir -p'
alias copy='sudo cp'              
alias rd='sudo rmdir'             
alias del='sudo rm'               
alias cls='sudo clear'            
alias dir='sudo l'                
alias cd..='cd ..'                
alias move='sudo mv'              
alias locate='locate -i'          
alias ed='sudo joe'
alias novo='ls -la'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
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

# distro specific  - Debian / Ubuntu and friends #
# install with apt-get
alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"
 
alias ag="sudo apt-get"
alias agi="sudo apt-get install"
alias agiy="sudo apt-get --yes install"
alias agu="sudo apt-get update"
alias acs="sudo apt-cache search"
alias ags=acs                          ### little dirty search alias for apt-get
alias acsh='sudo apt-cache show'
alias afs='sudo apt-file show'
alias afl='sudo apt-file list'

# update on one command 
alias update='sudo apt-get update && sudo apt-get upgrade'

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

# git
alias ga='git add'
alias gaa='git add -A'
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

#phpunit

alias t=phpunit