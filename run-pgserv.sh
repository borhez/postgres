#!/bin/bash

source vars.config

docker network create $NET
docker run -d -h $HOSTNAME -u postgres --rm -e $USER -e $PASSWD -v $MOUNT --network $NET -P postgres:16.2-alpine3.19
ID=$(docker ps | head -n2 | awk 'NR>1 {print $1}')
docker exec -u root $ID mkdir $SERVER_DIR
docker exec -u root $ID chown postgres:postgres $SERVER_DIR
docker exec -u postgres $ID bash ${DEST_SCRYPT} $SERVER_DIR

docker exec -it -u postgres $ID bash

