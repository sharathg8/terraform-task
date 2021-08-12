#!/bin/bash
set -xe

sudo add-apt-repository universe
sudo apt-get update
sudo apt-get -y install ansible
sudo wget https://aka.ms/downloadazcopy-v10-linux
sudo tar -xvf downloadazcopy-v10-linux
./azcopy_linux_amd64_10.11.0/azcopy copy 'https://k8stfstate007.blob.core.windows.net/playbook?sp=rcwl&st=2021-08-12T05:10:46Z&se=2021-08-27T13:10:46Z&sv=2020-08-04&sr=c&sig=WNf4ecndxO%2FEw8aXMVbXYJ63PBQw8f%2BlY1mq4iso65o%3D' '/tmp' --recursive
cd /tmp/playbook; sudo ansible-playbook main.yml -vv
