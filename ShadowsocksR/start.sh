#!/bin/bash
nohup ss-redir -c /etc/config.json  -b 0.0.0.0 -l 1081 &
sleep 5
ss-local -c /etc/config.json -b 0.0.0.0 -l 1080 -u --fast-open
