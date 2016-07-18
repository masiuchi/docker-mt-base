#!/bin/bash
# http://stackoverflow.com/questions/31746182/docker-compose-wait-for-container-x-before-starting-y
while ! nc -z mysql 3306; do sleep 3; done
start_server --port=3000 --pid-file=/app/run/movabletype.pid -- plackup -s Starlet --max-workers=2 mt.psgi

