#!/bin/bash


ps
export PGDATA=$1
echo "HI: $PGDATA"
initdb -U postgres -k
