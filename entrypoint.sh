#!/bin/bash
# VARIABLES
GAME_DIR="/appdata/rising-world-java/dedicated-server"
CONFIG_PATH="${GAME_DIR}/server.properties"
GAME_ID=339010

mkdir -p ${GAME_DIR}
chown -R steam:steam ${GAME_DIR}
echo "-------------------------------START------------------------------"
su -c "~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ${GAME_DIR} +app_update ${GAME_ID} validate +quit" steam

## copy defaults
cp -r ~/defaults/* ${GAME_DIR}
chown -R steam:steam ${GAME_DIR}

## CONFIG UPDATES ##
# sed -i "s/admins=.*/admins=${cfg_admins}/" ${CONFIG_PATH}
# sed -i "s/webadmin=.*/webadmin=${cfg_webadmin}/" ${CONFIG_PATH}
## END UPDATES ##

cd ${GAME_DIR}
java -Xmx${GAME_MEMORY_MB}m -Xms$((GAME_MEMORY_MB/2))m -jar server.jar
echo "--------------------------------END-------------------------------"
sleep 10