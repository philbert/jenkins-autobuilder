#!/bin/bash

echo "Setting up the jenkins user .ssh directory"
sudo -u jenkins mkdir /var/lib/jenkins/.ssh

echo "Generating the ssh keypair and add it to agent"
ssh-keygen -f id_rsa -t rsa -N ''
eval `ssh-agent -s`
ssh-add id_rsa

echo "move the keys to the correct place in the jenkins root"
sudo mv id_rsa* /var/lib/jenkins/.ssh
sudo chown jenkins:nogroup -R /var/lib/jenkins/.ssh

