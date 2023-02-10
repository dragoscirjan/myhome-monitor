#! /bin/bash
set -ex

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

# base_dir=$(dirname $0)

# sudo bash $(dirname $0)/../init.sh

# sudo rm -rf /opt/grafana-setup
# sudo git clone https://github.com/dragoscirjan/grafana-setup.git /opt/grafana-setup

# cd /opt/grafana-setup && sudo make up

# cd $base_dir


crontab -r
cat <<EOF > /tmp/crontab
*/30 * * * *    ubuntu  bash $SCRIPTPATH/../../bin/crontab-mi2-temp-humid-sensors.sh east
EOF

crontab /tmp/crontab