#!/bin/bash
#
#  Just run it: 
#    curl https://raw.github.com/antonioribeiro/dev-box/master/install.sh > /tmp/install.sh && source /tmp/install.sh
#
#   

LOG_FILE=`mktemp`
SCRIPT_PATH='/etc/dev-box'

function main() {
	clear

	message
	message "## dev-box install script ##"
	message

	if [ -f $SCRIPT_PATH/.git/config ]; then
		message "Already installed."
		message "Now you just need to use Ansible to run your playbooks."
		message "Aborted."
		message
		exit 1
	fi

	message "Installation is being logged to $LOG_FILE"
	message
	message "Creating directory $SCRIPT_PATH"

	sudo mkdir -p $SCRIPT_PATH 2>&1 | tee -a $LOG_FILE &> /dev/null

	message "Configure SSH for automatic knowing all hosts"
	mkdir -p ~/.ssh
	echo "Host *" >> ~/.ssh/config
	echo "  StrictHostKeyChecking no" >> ~/.ssh/config

	message "Updating apt sources"
	sudo apt-get --yes update 2>&1 | tee -a $LOG_FILE &> /dev/null

	# declare an array of packages and pass it by name
	declare -a packages=("git" "python" "python-pycurl" "python-apt" "python-pip" "python-dev" "python-keyczar" "sshpass" "build-essential joe")
	installAptPackages packages

	message "Cloning antonioribeiro/ansible repository"
	sudo git clone ./roles/laravel/templates/laravel-nginx-location-block-conf.tpl
./roles/laravel/templates/laravel-apache-virtualhost.conf.tpl
./roles/laravel/templates/laravel-nginx-server-block-conf.tpl
./roles/phpunit/templates/composer.json.tpl
./roles/nginx/templates/etc-nginx-conf-expires.conf.tpl
./roles/beanstalkd/templates/apache2-virtualhost.tpl
./roles/beanstalkd/templates/config.php.tpl
./roles/beanstalkd/templates/nginx-virtualhost.tpl
./roles/supervisor/templates/laravel.conf.tpl
./roles/postgresql/templates/phppgadmin.conf.tpl
./roles/common/templates/aliases.sh.tpl
./roles/phpmyadmin/templates/phpmyadmin-nginx-virtualhost.conf.tpl
./roles/phpmyadmin/templates/phpmyadmin-apache2-virtualhost.conf.tpl
https://github.com/antonioribeiro/dev-box.git $SCRIPT_PATH 2>&1 | tee -a $LOG_FILE &> /dev/null
	sudo cp $SCRIPT_PATH/hosts.default $SCRIPT_PATH/hosts
	sudo cp $SCRIPT_PATH/playbook.default.yml $SCRIPT_PATH/playbook.yml
	sudo cp $SCRIPT_PATH/group_vars/default-all $SCRIPT_PATH/group_vars/all

	message "Installing Jinja"
	sudo easy_install jinja2 2>&1 | tee -a $LOG_FILE &> /dev/null

	message "Installing Ansible"
	sudo pip install ansible 2>&1 | tee -a $LOG_FILE &> /dev/null

	message "Sourcing aliases"
	source $SCRIPT_PATH/roles/common/templates/aliases.sh.tpl 2>&1 | tee -a $LOG_FILE &> /dev/null

	message
	message "First part of installation is done. Now you have to follow some steps:" 
	message
	message "- Edit the file hosts, set your hosts configuration and add comments to disable what you don't want to install."
	message "- Edit the file group_vars/all and set your personal preferences and passwords"
	message "- Execute Ansible by running: "
	message "     ansible-playbook --inventory-file=/etc/dev-box/hosts /etc/dev-box/playbook.yml -K "
	message
	message

	cd $SCRIPT_PATH
}

######## functions 

function message() {
	if [ "$1" != "" ]; then
		command="echo $@"
		${command}
	else
		echo
	fi

	log "-------- $@"
}

function log() {
	if [[ "$LOG_FILE" != "" ]] && [[ -f $LOG_FILE ]]; then
		echo "$@" >>$LOG_FILE 2>&1
	fi
}

function installAptPackages() {

  param1=$1[@]
  packages=("${!param1}")

  for package in "${packages[@]}" ; do
    message "Installing $package..."
    sudo apt-get install --yes $package 2>&1 | tee -a $LOG_FILE &> /dev/null
  done

}

main $@
