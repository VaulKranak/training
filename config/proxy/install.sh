#!/bin/bash
script_dir=$(dirname $0)

sudo [ -d ~/.docker ] && echo ~/.docker exists || mkdir ~/.docker
sudo cp $script_dir/config.json ~/.docker/config.json
sudo cp $script_dir/docker /etc/default/docker
sudo cp $script_dir/docker.service /lib/systemd/system/docker.service
sudo cp $script_dir/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl restart network-manager
