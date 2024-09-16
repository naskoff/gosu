#!/bin/bash
set -e

echo $(id -u)
echo $(whoami)
echo $(pwd)
echo $UID
echo $GID
echo $USER
echo $GROUP

if [ -z "$1" ]; then
  exec supervisord -c /etc/supervisord.conf -n
else
  exec gosu $USER "$@"
fi
