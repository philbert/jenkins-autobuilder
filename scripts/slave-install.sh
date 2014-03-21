#!/bin/bash

echo "Sometimes ssh starts a bit too fast, so lets sleep for 10 seconds before starting" 
sleep 10


sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y openjdk-7-jre
sudo useradd -m jenkins
sudo -u jenkins mkdir /home/jenkins/.ssh

