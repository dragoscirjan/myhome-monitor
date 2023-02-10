#! /bin/bash

# base_dir=$(dirname $0)

# sudo bash $(dirname $0)/../init.sh

# sudo rm -rf /opt/grafana-setup
# sudo git clone https://github.com/dragoscirjan/grafana-setup.git /opt/grafana-setup

# cd /opt/grafana-setup && sudo make up

# cd $base_dir


crontab -r
cat <<EOF
*/30 * * * *    ubuntu  bash $(dirname $0/../..)/bin/crontab-mi2-temp-humid-sensors.sh east
EOF