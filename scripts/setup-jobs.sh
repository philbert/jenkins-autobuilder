#!/bin/bash

echo "We're going to use Openstack's jenkins-job builder to setup our initial jobs." 
echo "First we need python, pip and pbr"
curl -O http://python-distribute.org/distribute_setup.py
sudo python distribute_setup.py
sudo easy_install pip pbr

echo "Now install the jenkins-job-builder"
git clone https://github.com/openstack-infra/jenkins-job-builder.git
sudo python jenkins-job-builder/setup.py install

echo "Installing preconfigured jobs"
jenkins-jobs update /tmp/build-jenkins-master.yaml

