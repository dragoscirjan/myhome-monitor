#! /bin/bash

# /home/ubuntu/myhome-monitor/3rdparty/MiTemperature2/../../bin/mi2-temp-humid-to-file.sh sensorname,temperature,humidity,voltage,batteryLevel,timestamp kidsroom 23.77 46 3.094 99 1647290484

push_file = /tmp/mi2-temp-humid-colector.push
add_types = 1

if [ -f $push_file ]; then
    grep TYPE $push_file -RIn > /dev/null && add_types=0
fi

if [ $add_types -eq 1 ]; then
    
    cat <<EOF >> $push_file
# TYPE test_temp_celsius gauge
# HELP test_temp_celsius Temperature, celsius
test_temp_celsius{sensor="$2"} $3
# TYPE test_humidity_pct gauge
# HELP test_humidity_pct Humidity, percentage
test_humidity_pct{sensor="$2"} $4
# TYPE test_battery_voltage gauge
# HELP test_battery_voltage Battery, voltage
test_battery_voltage{sensor="$2"} $5
# TYPE test_battery_pct gauge
# HELP test_battery_pct Humidity, percentage
test_battery_pct{sensor="$2"} $6
EOF
    
else
    
    cat <<EOF >> $push_file
test_temp_celsius{sensor="$2"} $3
test_humidity_pct{sensor="$2"} $4
test_battery_voltage{sensor="$2"} $5
test_battery_pct{sensor="$2"} $6
EOF
    
fi