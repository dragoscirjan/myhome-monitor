#! /bin/bash

source .env

if [ -f .env.local ]; then
    source .env.local
fi

push_file=/tmp/mi2-temp-humid-colector.prom
gateway_url=$PROMETHEUS_PUSHGATEWAY_URL

cat $push_file | curl -X POST -H "Content-type: text/plain" \
--data-binary @- $gateway_url/metrics/job/tempBatch

echo "" > $push_file