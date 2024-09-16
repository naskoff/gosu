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
  echo "\nNo arguments\n"
else
  echo "\nArguments: " $@ "\n"
fi

exec docker-php-entrypoint "$@"