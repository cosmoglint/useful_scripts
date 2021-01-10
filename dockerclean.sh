#!/bin/sh

docker container stop $(docker conatiner ls -q)
echo -e '\n'
echo -e "y\n" | docker system prune --volumes
echo -e 'done'
