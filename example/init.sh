#!/bin/bash

# create target directory if it does not exist
mkdir -p /appdata/rising-world-java/dedicated-server
# copy files from data to game directory
rsync -rltDvzr ./data/* /appdata/rising-world-java/dedicated-server
# set user:group to copied files
chown -R 1000:1000 /appdata/rising-world-java/dedicated-server

# start service
docker compose up -d