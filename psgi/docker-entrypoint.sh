#!/bin/bash
set -e

if [ ! -f mt-config.cgi ]; then
    cp /root/mt-config.cgi.default mt-config.cgi
fi

# http://stackoverflow.com/questions/31746182/docker-compose-wait-for-container-x-before-starting-y
while ! nc -z mysql 3306; do sleep 3; done

exec "$@"

