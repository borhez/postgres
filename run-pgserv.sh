#!/bin/bash
source vars.config

docker network create $NET
docker run -d -h ${HOSTNAME1} -u postgres --rm -e $USER -e $PASSWD -v $MOUNT --network $NET -P $PG_IMAGE
ID=$(docker ps | head -n2 | awk 'NR>1 {print $1}')

#для контейнера, в котором не запущен сервер-postgres, надо раскомментировать след. 3 строки, т.к.
#в официальном контейнере-postgres, уже запущен сервер.
#docker exec -u root $ID mkdir $SERVER_DIR
#docker exec -u root $ID chown postgres:postgres $SERVER_DIR
#docker exec -u postgres $ID bash ${DEST_SCRYPT} $SERVER_DIR

docker exec -it -u postgres $ID bash

