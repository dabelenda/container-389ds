#!/bin/bash

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${LDAP_RUN_USER:-default}:x:$(id -u):0:${LDAP_RUN_USER:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
  if [ -w /etc/group ]; then
    echo "${LDAP_RUN_GROUP:-default}:x:$(id -u):${LDAP_RUN_USER:-default}" >> /etc/group
  fi
fi

mkdir -p /tmp/.dirsrv
