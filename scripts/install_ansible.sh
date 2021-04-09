#!/bin/bash
cd /tmp
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
sudo pip install --upgrade pip
sudo pip install ansible==2.4.3.0
#sudo pip install ansible==2.6.5.0
cd /vagrant
make install-ansible-requirements
