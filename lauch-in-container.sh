#!/bin/bash
su - postgres
export PGDATA=/var/lib/postgresql/data/
initdb -U postgres -k
