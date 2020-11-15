#!/bin/bash

echo '++++++++++++++++++++++++'
echo 'BEGIN: installing Chrome'
echo '++++++++++++++++++++++++'

echo '--------------------------------------------------------------------------------------'
echo 'curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add'
curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add
wait

echo '----------------------------------------------------------------------------------------------------------------------------'
echo '"deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list'
echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
wait

echo '-------------------'
echo 'sudo apt-get update'
sudo apt-get update

echo '--------------------------------------------'
echo 'sudo apt-get -y install google-chrome-stable'
sudo apt-get -y install google-chrome-stable

echo '++++++++++++++++++++++'
echo 'END: installing Chrome'
echo '++++++++++++++++++++++'
