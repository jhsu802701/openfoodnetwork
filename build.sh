#!/bin/bash

bash install-node.sh
bash install-ruby.sh

echo '-------'
echo 'node -v'
node -v
echo ''

echo '-------'
echo 'ruby -v'
ruby -v
