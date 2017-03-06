#!/bin/bash

get_pid() {
  echo `ps -o pid -C ns-slapd --no-headers`
}

# Shutting down 389ds
if [ ! -z "$(get_pid)" ]; then
  kill "$(get_pid)"
  echo -n "waiting for 389ds to shutdown: "
fi

while [ ! -z "$(get_pid)" ]; do
  echo -n "."
  sleep 1
done
echo
