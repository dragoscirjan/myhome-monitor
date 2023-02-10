#! /bin/bash

sudo curl -L -o /usr/bin/yq https://github.com/mikefarah/yq/releases/download/v4.30.8/yq_linux_arm64
sudo chmod 755 /usr/bin/yq

curl -sSL https://get.docker.com | sudo bash

sudo apt-get update
sudo apt-get install -y make


