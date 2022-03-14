#! /bin/bash

curl -X POST -H "Content-type: text/plain" --data "$(cat /tmp/mi2-temp-humid-colector.gauge)" $gateway_url/metrics/job/tempBatch/instance
echo "" > /tmp/mi2-temp-humid-colector.gauge