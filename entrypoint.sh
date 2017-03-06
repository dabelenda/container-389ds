#!/bin/bash

set -e

# Define default values of Environment Variables
: ${LDAP_ROOT_DN:="cn=Directory Manager"}
: ${LDAP_SUFFIX:="dc=example,dc=com"}
: ${LDAP_HOSTNAME:=`hostname -s`}
: ${LDAP_BASEDIR:="/etc/dirsrv/slapd-${LDAP_HOSTNAME}"}

# export useful variables
export LDAP_BASEDIR=${LDAP_BASEDIR}


# Test definition of Mandatory Variables
: ${LDAP_ROOT_PASSWORD:?"The Variable LDAP_ROOT_PASSWORD must be set"}

ldapmodify=( ldapmodify -h localhost -p 389 -x -w "${LDAP_ROOT_PASSWORD}" -D "${LDAP_ROOT_DN}" )

if [ ! -d ${LDAP_BASEDIR} ]; then
  find /entrypoint.d -type f | sort -n |
  while read f; do
    case "$f" in
      *.sh) echo "$0: running \"$f\""; . "$f" ;;
      *.ldif) echo "$0: applying ldif \"$f\""; "${ldapmodify[@]}" -f "$f" ;;
      *) echo "$0: ignoring $f" ;;
    esac
    echo
  done
fi
  
exec bash -c "$@"
