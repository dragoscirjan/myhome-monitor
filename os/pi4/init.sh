#! /bin/bash

base_dir=$(dirname $0)

sudo bash $(dirname $0)/../init.sh

sudo rm -rf /opt/grafana-setup
sudo git clone https://github.com/dragoscirjan/grafana-setup.git /opt/grafana-setup

cd /opt/grafana-setup && sudo make up

cd $base_dir