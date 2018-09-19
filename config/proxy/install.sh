#!/bin/bash

sudo [ -d ~/.docker ] && echo ~/.docker exists || mkdir ~/.docker
sudo cp config.json ~/.docker/config.json
sudo cp docker /etc/default/docker
sudo cp docker.service /lib/systemd/system/docker.service
sudo cp /etc/NetworkManager/NetworkManager.conf NetworkManager.conf
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl restart network-manager
