#!/bin/bash

cd /srv/newsheadline

npm install
bower install

node bin/server.js &