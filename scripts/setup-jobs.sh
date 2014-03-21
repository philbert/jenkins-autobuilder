#!/bin/bash

echo "We're going to use Openstack's jenkins-job builder to setup our initial jobs." 
echo "First we need python, pip and pbr"
curl -O http://python-distribute.org/distribute_setup.py
sudo python distribute_setup.py
sudo easy_install pip pbr

echo "Now install the jenkins-job-builder"
git clone https://github.com/openstack-infra/jenkins-job-builder.git
cd jenkins-job-builder
sudo python setup.py install

echo "Setup the preconfigured jobs"
sudo mkdir /etc/jenkins_jobs
sudo mv /tmp/jenkins_jobs.ini /etc/jenkins_jobs
jenkins-jobs update /tmp/build_jenkins_master.yaml
jenkins-jobs update /tmp/build_jenkins_slave.yaml
jenkins-jobs update /tmp/add_slave.yaml
