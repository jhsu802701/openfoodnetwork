#!/bin/bash

RUBY_VERSION=`cat .ruby-version`
echo '-------------------------'
echo "rvm install $RUBY_VERSION"
rvm install $RUBY_VERSION
wait

echo '---------------------'
echo "rvm use $RUBY_VERSION"
rvm use $RUBY_VERSION
wait
