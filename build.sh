#!/bin/bash

# BEGIN: activate NVM
export NVM_DIR="/home/`whoami`/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# END: activate NVM

source ~/.rvm/scripts/rvm # Activate RVM

bash install-node.sh
bash install-ruby.sh

echo '-------'
echo 'node -v'
node -v

echo '-------'
echo 'ruby -v'
ruby -v

bash install-chrome.sh

echo '-----------------------------'
echo 'gem install bundler -v 1.17.3'
gem install bundler -v 1.17.3

echo '----------------------'
echo 'Configuring PostgreSQL'
sudo -u postgres psql -c "CREATE USER ofn WITH SUPERUSER CREATEDB PASSWORD 'f00d'"

echo '------------------------------------------------'
echo 'bundle install --deployment --path vendor/bundle'
bundle install --deployment --path vendor/bundle

echo '*******************'
echo 'BEGIN: script/setup'
echo '*******************'
script/setup
echo '*****************'
echo 'END: script/setup'
echo '*****************'

echo '--------------------------------'
echo 'bundle exec rake db:test:prepare'
bundle exec rake db:test:prepare

echo '*****************************'
echo 'BEGIN: bundle exec rspec spec'
echo '*****************************'
bundle exec rspec spec
echo '***************************'
echo 'END: bundle exec rspec spec'
echo '***************************'
