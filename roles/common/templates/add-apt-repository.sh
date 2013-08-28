#!/bin/bash

grep -h "$1" /etc/apt/sources.list > /dev/null 2>&1
if [ $? -ne 0 ]
then
  echo "Adding ppa:$1"
  add-apt-repository -y ppa:$1
  apt-get update
fi
