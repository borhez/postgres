#!/bin/bash
#если сервер-postgres вручную устанавливаешь в контейнер с OS, то там надо запускать этот скрипт.
#в официальном контейнере-postgres, уже запущен сервер, поэтому в моём случае этот скрипт не вызываю из run-pgserv.sh
export PGDATA=$1
initdb -U postgres -k

