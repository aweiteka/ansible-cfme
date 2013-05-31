#!/usr/bin/env bash

# setup rbev path
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bash_profile
echo 'eval "$(rbenv init -)"' >> $HOME/.bash_profile
source $HOME/bash_profile

# install rbenv
eval "rbenv install 1.9.3-p327"
eval "rbenv rehash"
eval "rbenv local 1.9.3-p327"
eval "rbenv shell 1.9.3-p327"
eval "rbenv rehash"

# build
cd $HOME/.rbenv/plugins
eval "rbenv gemset create 1.9.3-p327 cfme"
cd $HOME/.rbenv/versions/1.9.3-p327/gemsets/cfme
eval ">.rbenv-gemsets <<<cfme"
cd /var/www/cfme/vmdb
eval ">.rbenv-gemsets <<<cfme"
eval "rbenv gemset active"
eval "rbenv rehash"

# install bundler
eval "/usr/bin/gem install bundler -v '1.1.3'"
eval "rbenv local 1.9.3-p327"
eval "rbenv rehash"
# dev wiki page references the latter but both seem to work
#bundle install
eval "/usr/local/bin/bundle install --without=development metric_fu test_ui test sqlserver"

