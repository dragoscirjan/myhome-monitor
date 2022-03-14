#! /bin/bash

push_file=/tmp/mi2-temp-humid-colector.prom
gateway_url=http://192.168.1.3:9091

cat $push_file | curl -X POST -H "Content-type: text/plain" \
--data-binary @- $gateway_url/metrics/job/tempBatch

echo "" > $push_file