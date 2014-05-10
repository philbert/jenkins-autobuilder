jenkins-autobuilder
===================

This project will build and configure a new jenkins master and it's slaves on AWS using packer. Please read the documentation at http://www.packer.io/docs to learn how packer works.

This project is still a work in progress.

Requirements
------------
* Packer
* EC2 command line tools
* EC2 account

Tested on:
* OSX Mavericks

Install Dependencies
-------------------
#### Create AWS account
If you don't already have an account on AWS go sign up first [here](http://aws.amazon.com)
#### Install EC2 command line tools
Follow [these directions](http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/set-up-ec2-cli-linux.html) to set up the EC2 command line tools. Alternatively, if you are on OSX and have homebrew installed, you can just run "brew install ec2-api-tools". 
#### Install Packer
Install Packer from [http://www.packer.io](http://www.packer.io). Again, if you are on OSX with homebrew, just perform a `brew install packer` and you'll get the latest version.

Instructions
-------------------
Clone this repo and run `packer build ubuntu-jenkins-ami.json`. Packer will then build you a new ami with a jenkins master bootstrapped on the base-ami specified in the json file.

At the end of the packer build, the console output will tell you the name of the ami it has create. Go and start this instance on EC2 and you will discover you have some preconfigured jobs there already there.
* to build a new master (using this exact same method described here)
* build a new jenkins slave which connects to the master using the swarm plugin (still a manual step to add the necessary environment variables and fix ports so that this works)
* add a new jenkins slave which will spin up the instance create and auto connect to the jenkins master
* you need to allow traffic into the master from the slaves on ports 8080 for discovery and 42529 to complete the connection.

TODOs
-------------------
There is still some manual work involved to get the jobs building on the master on AWS. If you are familiar with jenkins then this should be pretty straight forward for you, however the intention is to Automate All The Things.
Porting the project to other providers such as openstack and docker are also on the agenda.

Licence
-------------------
The MIT License (MIT)

Copyright (c) 2015 Philip Cheong

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
