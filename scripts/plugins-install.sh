#!/bin/bash

sudo apt-get install -y unzip

wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
sudo mkdir /usr/local/ec2
sudo unzip ec2-api-tools.zip -d /usr/local/ec2

echo "It takes some time for jenkins to come up so we need to look through this a few times"
wget "http://`hostname -f`:8080/jnlpJars/jenkins-cli.jar"
while [ $? -ne 0 ]
do
  echo "Jenkins not up yet. Sleeping for 5 sec"
  sleep 5
  wget "http://`hostname -f`:8080/jnlpJars/jenkins-cli.jar"
done
echo "Jenkins is up! Downloading plugins" 

echo "There is some bug with the plugin installer so we have to follow procedure here https://gist.github.com/rowan-m/1026918"
curl -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -X POST -H 'Accept: application/json' -d @- http://localhost:8080/updateCenter/byId/default/postBack
java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin Git Swarm Bitbucket
#java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin http://updates.jenkins-ci.org/download/plugins/git/2.0.4/git.hpi http://updates.jenkins-ci.org/download/plugins/swarm/1.15/swarm.hpi http://updates.jenkins-ci.org/download/plugins/bitbucket/1.0/bitbucket.hpi
#cd /var/lib/jenkins/plugins
#wget http://updates.jenkins-ci.org/download/plugins/git/2.0.4/git.hpi 
#wget http://updates.jenkins-ci.org/download/plugins/swarm/1.15/swarm.hpi 
#wget http://updates.jenkins-ci.org/download/plugins/bitbucket/1.0/bitbucket.hpi
#curl http://`hostname -f`:8080/reload

