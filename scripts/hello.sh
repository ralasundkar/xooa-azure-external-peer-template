#!/bin/bash

sudo mkdir /home/iamrupesh/


sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common sudo -y

sudo curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"

sudo apt-get update -y

sudo apt-get install docker-ce -y

sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo docker-compose --version


sudo curl -fsSL https://get.docker.com/ -o get-docker.sh

sudo sh get-docker.sh

sudo apt install jq -y

# Authenticate token
curl  --header "Authorization: Bearer $1" --header "Content-Type: application/json"  --header "Accept: application/json" -X POST http://1f64b534.ngrok.io/download-peer | jq -r '.data' | base64 --decode > ./xooa-peer.zip

# Extract peer zip and then run it
sudo apt install -y unzip

sudo unzip xooa-peer.zip -d xooa-peer -o

cd xooa-peer

sudo docker-compose up -d

echo 'hello'
