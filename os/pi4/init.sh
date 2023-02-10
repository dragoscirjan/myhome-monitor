#! /bin/bash

bash $(dirname $0)/../init.sh

sudo rm -rf /opt/grafana-setup
sudo git clone https://github.com/dragoscirjan/grafana-setup.git /opt/grafana-setup

cd /opt/grafana-setup && sudo make up
