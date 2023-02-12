#! /bin/bash
set -ex

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

speed_data=$(speedtest --json)

if_name=$(ip addr | awk '/state UP/ {print $2}' | sed 's/.$//')

if_ssid_name=$(nmcli -t -f name,device connection show --active | grep $if_name | cut -d\: -f1)

if [ "$if_ssid_name" == "" ]; then
  if_ssid_name=$(iw dev $if_name info | grep ssid | awk '{print $2}')
fi

# if_rx_bitrate=$(cat /proc/net/dev | grep $if_name | awk '{print $2}')
# if_tx_bitrate=$(cat /proc/net/dev | grep $if_name | awk '{print $10}')


push_file=/tmp/speed-test.prom
add_types=1

prefix=

if [ -f $push_file ]; then
  grep TYPE $push_file -RIn > /dev/null && add_types=0
fi

if [ $add_types -eq 1 ]; then

  cat <<EOF >> $push_file
# TYPE ${prefix}net_download gauge
# HELP ${prefix}net_download Download Speed, MBps
${prefix}net_download{if="$if_name"}{ssid="$if_ssid_name"} $(echo $speed_data | jq ".download" -r)
# TYPE ${prefix}net_download gauge
# HELP ${prefix}net_download Download Speed, MBps
${prefix}net_upload{if="$if_name"}{ssid="$if_ssid_name"} $(echo $speed_data | jq ".upload" -r)
# TYPE ${prefix}net_ping gauge
# HELP ${prefix}net_ping Download Speed, seconds
${prefix}net_upload{if="$if_name"}{ssid="$if_ssid_name"} $(echo $speed_data | jq ".ping" -r)
EOF

else

  cat <<EOF >> $push_file
${prefix}net_download{if="$if_name"}{ssid="$if_ssid_name"} $(echo $speed_data | jq ".download" -r)
${prefix}net_upload{if="$if_name"}{ssid="$if_ssid_name"} $(echo $speed_data | jq ".upload" -r)
${prefix}net_upload{if="$if_name"}{ssid="$if_ssid_name"} $(echo $speed_data | jq ".ping" -r)
EOF

fi

