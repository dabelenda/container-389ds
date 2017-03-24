#!/bin/bash

if [ ! -z "${LDAP_EXTRA_SCHEMA_DEFS}" ]; then
  echo "${LDAP_EXTRA_SCHEMA_DEFS}" > ${LDAP_BASEDIR}/schema/98-docker-extra-schema.ldif
fi
