#!/bin/bash

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

    searchAndReplace $DESTINATION_FOLDER $SKELETON_NAME         $PACKAGE_NAME
    searchAndReplace $DESTINATION_FOLDER $SKELETON_NAME_CAPITAL $PACKAGE_NAME_CAPITAL
    searchAndReplace $DESTINATION_FOLDER $VENDOR_NAME           $SKELETON_VENDOR_NAME
    searchAndReplace $DESTINATION_FOLDER $VENDOR_NAME_CAPITAL   $SKELETON_VENDOR_NAME_CAPITAL

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
    export DESTINATION_FOLDER=/var/www/\<name\>
    inquireText "Package destination folder:" $DESTINATION_FOLDER
    export DESTINATION_FOLDER=$answer

    if [[ -d $DESTINATION_FOLDER ]]; then
        message
        message "Destination folder already exists. Aborting..."
        message
        exit 1
    fi

    message 

    export VENDOR_NAME=pragmarx
    inquireText "Vendor name (lowercase):" $VENDOR_NAME
    export VENDOR_NAME=$answer

    export VENDOR_NAME_CAPITAL=${VENDOR_NAME^}
    inquireText "Vendor name (Capitalized):" $VENDOR_NAME_CAPITAL
    export VENDOR_NAME_CAPITAL=$answer

    message 

    export PACKAGE_REPOSITORY=
    inquireText "Your new package repository link (create a package first or leave it blank):" $PACKAGE_REPOSITORY
    export PACKAGE_REPOSITORY=$answer

    export PACKAGE_NAME=$(basename $DESTINATION_FOLDER)
    inquireText "Your new package name (lowercase):" $PACKAGE_NAME
    export PACKAGE_NAME=$answer

    export PACKAGE_NAME_CAPITAL=${PACKAGE_NAME^}
    inquireText "Your new package name (Capitalized):" $PACKAGE_NAME_CAPITAL
    export PACKAGE_NAME_CAPITAL=$answer

    message 

    export SKELETON_VENDOR_NAME=$VENDOR_NAME
    inquireText "Skeleton Vendor name (lowercase):" $SKELETON_VENDOR_NAME
    export SKELETON_VENDOR_NAME=$answer

    export SKELETON_VENDOR_NAME_CAPITAL=$VENDOR_NAME_CAPITAL
    inquireText "Skeleton Vendor name (Capitalized):" $SKELETON_VENDOR_NAME_CAPITAL
    export SKELETON_VENDOR_NAME_CAPITAL=$answer

    message 

    export SKELETON_REPOSITORY=https://github.com/antonioribeiro/skeleton.git
    inquireText "Skeleton repository link:" $SKELETON_REPOSITORY
    export SKELETON_REPOSITORY=$answer

    export SKELETON_NAME=skeleton
    inquireText "Skeleton name (lowercase):" $SKELETON_NAME
    export SKELETON_NAME=$answer

    export SKELETON_NAME_CAPITAL=${SKELETON_NAME^}
    inquireText "Skeleton name (Capitalized):" $SKELETON_NAME_CAPITAL
    export SKELETON_NAME_CAPITAL=$answer
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
    echo "Now open one of your applications composer.json and add to it:"
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
