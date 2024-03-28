#!/bin/bash

docker network create postgres1
MOUNT_FILE=$(realpath ./launch-in-container.sh)

docker run --rm -d --network postgres1 -h pstgrserv -v $MOUNT_FILE:/var/lib/postgresql/data/initdb.sh -p 9999:5432 postgres:16.2-alpine3.19  



