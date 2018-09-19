sudo cp config.json ~/.docker/config.json
sudo cp docker /etcdefault/docker
sudo cp docker.service /libsystemd/system/docker.service
sudo cp /etc/NetworkManager/NetworkManager.conf
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl restart network-manager

