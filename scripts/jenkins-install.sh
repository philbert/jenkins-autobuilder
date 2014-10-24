#!/bin/bash

echo "Sometimes ssh comes up a bit too quick so we sleep for 10 seconds before we begin..."
sleep 10

echo "Installing Jenkins"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins git

sudo service jenkins start
