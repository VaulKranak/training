#!/bin/bash
script_dir=$(dirname $0)

sudo setup_intel_proxy.sh

sudo [ -d ~/.docker ] && echo ~/.docker exists || mkdir ~/.docker
sudo cp $script_dir/config.json ~/.docker/config.json
sudo cp $script_dir/docker /etc/default/docker
sudo cp $script_dir/docker.service /lib/systemd/system/docker.service
sudo [ -d /etc/systemd/system/docker.service.d ] && echo /etc/systemd/system/docker.service.d exists || sudo mkdir /etc/systemd/system/docker.service.d
sudo cp $script_dir/http-proxy.conf /etc/systemd/system/docker.service.d/http-proxy.conf
sudo cp $script_dir/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl restart network-manager
