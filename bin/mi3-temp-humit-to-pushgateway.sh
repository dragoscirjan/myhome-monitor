#! /bin/bash

gateway_url=http://192.168.1.3:9091

cat /tmp/mi2-temp-humid-colector.gauge \
| curl -X POST -H "Content-type: text/plain" \
--data-binary @- $gateway_url/metrics/job/tempBatch

echo "" > /tmp/mi2-temp-humid-colector.gauge