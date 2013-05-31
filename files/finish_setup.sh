#!/usr/bin/env bash

cd /var/www/cfme/vmdb
sudo -u postgres psql -c "create role root with login createdb password 'smartvm'"
rake db:create:all
bin/rake db:migrate

# FIXME: execute from screen session
bin/rake evm:start
