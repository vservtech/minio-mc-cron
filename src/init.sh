#!/usr/bin/env bash

## Load all crontabs 
chmod -R 0644 /etc/cron.d/* 
crontab /etc/cron.d/*

# start cron
cron -f