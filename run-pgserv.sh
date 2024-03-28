#!/bin/bash

NET1=postgres1
USER='POSTGRES_USER=postgres'
PASSWD='POSTGRES_PASSWORD=postgres'
SOURCE='/home/sshield/languages/psql/postgres.git/src/launch-in-container.sh'
DEST_SCRYPT='/pg/initdb.sh'
MOUNT="${SOURCE}:${DEST_SCRYPT}"
SERVER_DIR='/pg/server-data'
HOSTNAME=pgserver

docker network create $NET1
docker run -d -h $HOSTNAME -u postgres --rm -e $USER -e $PASSWD -v $MOUNT --network $NET1 -P postgres:16.2-alpine3.19
ID=$(docker ps | head -n2 | awk 'NR>1 {print $1}')
docker exec -u root $ID mkdir $SERVER_DIR
docker exec -u root $ID chown postgres:postgres $SERVER_DIR
docker exec -u postgres $ID bash ${DEST_SCRYPT} $SERVER_DIR

docker exec -it -u postgres $ID bash

