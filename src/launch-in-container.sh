#!/bin/bash

export PGDATA=$1
initdb -U postgres -k
