#!/bin/bash
apt-get -y install git jq python-pip
pip install orchard

# Setup sudo permissions for git user.
echo "git ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/80-git-user
chmod 440 /etc/sudoers.d/80-git-user

# Install gitreceive
cd /usr/local/sbin/
sudo wget https://raw.github.com/progrium/gitreceive/master/gitreceive
sudo chmod a+x gitreceive
sudo gitreceive init
sudo mkdir /home/git/src
sudo chown git.git /home/git/src

# Add your key to the server
echo 'Run this: cat ~/.ssh/id_dsa.pub | ssh ubuntu@ip.address.goes.here -i put-your-key-here "sudo gitreceive upload-key ubuntu"'
