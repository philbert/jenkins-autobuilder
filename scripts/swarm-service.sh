#!/bin/bash

echo "Download swarm client, move it to the right place and set correct permissions"
wget http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.20/swarm-client-1.20-jar-with-dependencies.jar
sudo mv swarm-client-1.20-jar-with-dependencies.jar /usr/local/bin
sudo chown root:root /usr/local/bin/swarm-client-1.20-jar-with-dependencies.jar
sudo chmod +x /usr/local/bin/swarm-client-1.20-jar-with-dependencies.jar

echo "Move jenkins-slave.conf service to correct location and set permissions"
sudo mv /tmp/jenkins-slave.conf /etc/init/
sudo chown root:root /etc/init/jenkins-slave.conf

