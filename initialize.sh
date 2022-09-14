#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install cron vim python3 python3-venv -y
python3 -m venv venv
source venv/bin/activate
pip install ansible requests PyVmomi dnspython
ansible-galaxy collection install community.vmware
ansible-galaxy collection install community.general