#!/bin/bash

# BEGIN: activate NVM
export NVM_DIR="/home/`whoami`/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# END: activate NVM

NODE_VERSION=`cat .node-version`
echo '-------------------------'
echo "nvm install $NODE_VERSION"
nvm install $NODE_VERSION
wait
echo '---------------------'
echo "nvm use $NODE_VERSION"
nvm use $NODE_VERSION
wait

# Updating $HOME/.bashrc
STR1="nvm use node"
STR2="nvm use $NODE_VERSION"
sed -i.bak "s|$STR1|$STR2|g" $HOME/.bashrc
rm $HOME/.bashrc.bak
