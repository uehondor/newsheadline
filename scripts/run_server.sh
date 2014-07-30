#!/bin/bash

cd /srv/newsheadline

npm install
bower install

sudo service newsheadline start
