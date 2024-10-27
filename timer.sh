#!/bin/bash

LOG_DIR="/home/modesto/logs_nginx"
ONLINE_LOG="$LOG_DIR/nginx_online.log"
OFFLINE_LOG="$LOG_DIR/nginx_offline.log"

STATUS_SERVER=$(systemctl is-active nginx)

if [ "$STATUS_SERVER" = "active" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') Server nginx está ONLINE" >> "$ONLINE_LOG"
else 
    echo "$(date '+%Y-%m-%d %H:%M:%S') Server nginx está OFF-LINE" >> "$OFFLINE_LOG"
fi