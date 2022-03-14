#! /bin/bash

# /home/ubuntu/myhome-monitor/3rdparty/MiTemperature2/../../bin/mi2-temp-humid-to-file.sh sensorname,temperature,humidity,voltage,batteryLevel,timestamp kidsroom 23.77 46 3.094 99 1647290484

cat <<EOF >> /tmp/mi2-temp-humid-colector.gauge
temp_celsius{sensor="$2"} $3
humidity_pct{sensor="$2"} $4
battery_voltage{sensor="$2"} $5
battery_pct{sensor="$2"} $6
EOF