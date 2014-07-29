#!/bin/bash

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:chris-lea/node.js -y
sudo apt-get update

sudo apt-get install nodejs -y

sudo npm install bower -g