#!/bin/bash
nohup ss-tunnel -c /etc/config.json -b 0.0.0.0 -l 53 -L "8.8.8.8:53" -u &
sleep 5
nohup ss-redir -c /etc/config.json  -b 0.0.0.0 -l 1081 &
sleep 5
nohup ss-local -c /etc/config.json -b 0.0.0.0 -l 1080 -u &
sleep 5
ss-server -c /etc/config.json -s 0.0.0.0 -u
