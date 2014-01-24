#!/bin/bash

DEFAULT_VCS_USER=antonioribeiro

DEFAULT_VCS_SERVICE=github.com

DEFAULT_VENDOR_NAME=pragmarx

DEFAULT_SKELETON_NAME=skeleton

DEFAULT_SKELETON_REPOSITORY=https://github.com/antonioribeiro/skeleton.git

function main() {
    clear

    askForData

    createPackage
}

function searchAndReplace()
{
    find $1 -name "*" -exec sed -i "s/$2/$3/g" {} \; &> /dev/null
}

function createPackage()
{
    git clone $SKELETON_REPOSITORY $DESTINATION_FOLDER

    searchAndReplace $DESTINATION_FOLDER $SKELETON_NAME                 $PACKAGE_NAME
    searchAndReplace $DESTINATION_FOLDER $SKELETON_NAME_CAPITAL         $PACKAGE_NAME_CAPITAL
    searchAndReplace $DESTINATION_FOLDER $SKELETON_VENDOR_NAME          $VENDOR_NAME           
    searchAndReplace $DESTINATION_FOLDER $SKELETON_VENDOR_NAME_CAPITAL  $VENDOR_NAME_CAPITAL   

    renameAll $DESTINATION_FOLDER $SKELETON_NAME                 $PACKAGE_NAME
    renameAll $DESTINATION_FOLDER $SKELETON_NAME_CAPITAL         $PACKAGE_NAME_CAPITAL
    renameAll $DESTINATION_FOLDER $SKELETON_VENDOR_NAME          $VENDOR_NAME           
    renameAll $DESTINATION_FOLDER $SKELETON_VENDOR_NAME_CAPITAL  $VENDOR_NAME_CAPITAL   

    mv $DESTINATION_FOLDER/src/$SKELETON_NAME_CAPITAL.php $DESTINATION_FOLDER/src/$PACKAGE_NAME_CAPITAL.php
    rm -rf $DESTINATION_FOLDER/.git/

    cd $DESTINATION_FOLDER

    git init
    git add -A
    git commit -m "first commit"

    if [[ "$PACKAGE_REPOSITORY" != "" ]]; then
        git remote add origin $PACKAGE_REPOSITORY

        git push origin master

        displayInstructions
    fi
}

function askForData()
{
    DESTINATION_FOLDER=/var/www/\<name\>
    inquireText "Package destination folder:" $DESTINATION_FOLDER
    DESTINATION_FOLDER=$answer

    if [[ -d $DESTINATION_FOLDER ]]; then
        message
        message "Destination folder already exists. Aborting..."
        message
        exit 1
    fi

    message 

    VENDOR_NAME=`echo $DEFAULT_VENDOR_NAME | awk '{print tolower($0)}'`
    inquireText "Vendor name (lowercase):" $VENDOR_NAME
    VENDOR_NAME=$answer

    VENDOR_NAME_CAPITAL=${VENDOR_NAME^}
    inquireText "Vendor name (Capitalized):" $VENDOR_NAME_CAPITAL
    VENDOR_NAME_CAPITAL=$answer

    message 

    PACKAGE_NAME=`echo $(basename $DESTINATION_FOLDER) | awk '{print tolower($0)}'`
    inquireText "Your new package name (lowercase):" $PACKAGE_NAME
    PACKAGE_NAME=$answer

    PACKAGE_NAME_CAPITAL=${PACKAGE_NAME^}
    inquireText "Your new package name (Capitalized):" $PACKAGE_NAME_CAPITAL
    PACKAGE_NAME_CAPITAL=$answer

    if [[ "$DEFAULT_VCS_USER" != "" ]]; then
        VCS_USER=$DEFAULT_VCS_USER
    else
        VCS_USER=$VENDOR_NAME
    fi
    PACKAGE_REPOSITORY=https://$DEFAULT_VCS_SERVICE/$VCS_USER/$PACKAGE_NAME.git
    inquireText "Your new package repository link (create a package first or leave it blank):" $PACKAGE_REPOSITORY
    PACKAGE_REPOSITORY=$answer

    message 

    SKELETON_VENDOR_NAME=`echo $VENDOR_NAME | awk '{print tolower($0)}'`
    inquireText "Skeleton Vendor name (lowercase):" $SKELETON_VENDOR_NAME
    SKELETON_VENDOR_NAME=$answer

    SKELETON_VENDOR_NAME_CAPITAL=${SKELETON_VENDOR_NAME^}
    inquireText "Skeleton Vendor name (Capitalized):" $SKELETON_VENDOR_NAME_CAPITAL
    SKELETON_VENDOR_NAME_CAPITAL=$answer

    message 

    SKELETON_NAME=`echo $(basename $DEFAULT_SKELETON_NAME) | awk '{print tolower($0)}'`
    inquireText "Skeleton package name (lowercase):" $SKELETON_NAME
    SKELETON_NAME=$answer

    SKELETON_NAME_CAPITAL=${SKELETON_NAME^}
    inquireText "Skeleton package name (Capitalized):" $SKELETON_NAME_CAPITAL
    SKELETON_NAME_CAPITAL=$answer

    if [[ "$DEFAULT_SKELETON_REPOSITORY" != "" ]]; then
        SKELETON_REPOSITORY=$DEFAULT_SKELETON_REPOSITORY
    else
        SKELETON_REPOSITORY=https://$DEFAULT_VCS_SERVICE/$SKELETON_VENDOR_NAME/$SKELETON_NAME.git
    fi
    inquireText "Skeleton repository link:" $SKELETON_REPOSITORY
    SKELETON_REPOSITORY=$answer
}

function renameAll()
{
    renameFiles $1 $2 $3

    renameDirectories $1 $2 $3
}

function renameFiles()
{
    FOLDER=$1
    OLD=$2
    NEW=$3

    find $FOLDER -type f -print0 | while IFS= read -r -d $'\0' file; do
        dir=$(dirname $file)
        filename=$(basename $file)
        new=$dir/$(echo $filename | sed -e "s/$OLD/$NEW/g")

        if [[ "$file" != "$new" ]]; then
            if [ -f $file ]; then
                mv $file $new
            fi
        fi
    done    
}

function renameDirectories()
{
    FOLDER=$1
    OLD=$2
    NEW=$3

    find $FOLDER -type d -print0 | while IFS= read -r -d $'\0' file; do
        new=$(echo $file | sed -e "s/$OLD/$NEW/g")

        if [[ "$file" != "$new" ]]; then
            if [ -d $file ]; then
                mv $file $new
            fi
        fi
    done    
}

function inquireText()  {
    answer=""
    value=$2
    
    if [[ "$value" == "Pragmarx" ]]; then
        value=PragmaRX
    fi

    if [[ $BASH_VERSION > '3.9' ]]; then
        read -e -p "$1 " -i "$value" answer
    else
        read -e -p "$1 [hit enter for $value] " answer
    fi
}

function displayInstructions()
{
    echo
    echo
    echo "Now open one of your applications composer.json and add those items to their proper sections:"
    echo 
    echo "\"require\": {"
    echo "    \"$VENDOR_NAME/$PACKAGE_NAME\": \"dev-master\","
    echo "},"
    echo 
    echo 
    echo "and"
    echo 
    echo 
    echo "\"repositories\": ["
    echo "    {"
    echo "        \"type\": \"vcs\","
    echo "        \"url\":  \"$PACKAGE_REPOSITORY\""
    echo "    },"
    echo "],"
    echo
    echo
}

function message() {
    if [ "$1" != "" ]; then
        command="echo $@"
        ${command}
    else
        echo
    fi
}

main $@
