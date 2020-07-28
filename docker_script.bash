#!/bin/bash

echo "**************************** Update and Install docker utilities **************************"
apt update
apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

echo "************************************** Install Docker *************************************"
apt update
apt install docker-ce -y

echo "********************************** Start Docker Upsource ***********************************"

mkdir -p ~/upsource/data
mkdir -p ~/upsource/conf
mkdir -p ~/upsource/logs
mkdir -p ~/upsource/backups
chmod -R 777 ~/upsource

docker run -itd --name upsource-server-instance  -v ~/upsource/data:/opt/upsource/data -v ~/upsource/conf:/opt/upsource/conf -v ~/upsource/logs:/opt/upsource/logs  -v ~/upsource/backups:/opt/upsource/backups -p 8080:8080 -p 8443:8443 jetbrains/upsource:2019.1.1460
