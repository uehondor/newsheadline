#!/bin/bash

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:chris-lea/node.js -y
sudo apt-get update

sudo apt-get install git-core -y
sudo apt-get install nodejs -y

sudo npm install bower -g

servicePath="/etc/init/newsheadline.conf"
if [ ! -f "$servicePath" ]; then
  cp /srv/newsheadline/scripts/newsheadline.conf $servicePath
fi
