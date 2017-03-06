#!/bin/bash

if [ x"$LDAP_REPLICATION_ENABLE" == x"True" ]; then
  : ${LDAP_REPLICATION_INDEX:=`curl http://rancher-metadata/latest/self/container/service_index`}

  : ${LDAP_REPLICATION_DN:?"LDAP_REPLICATION_DN must be set when LDAP_REPLICATION_ENABLE is True"}
  : ${LDAP_REPLICATION_PASSWORD:?"LDAP_REPLICATION_PASSWORD must be set when LDAP_REPLICATION_ENABLE is True"}
  : ${LDAP_REPLICA_PURGE_DELAY:?"LDAP_REPLICA_PURGE_DELAY must be set when LDAP_REPLICATION_ENABLE is True"}
  : ${LDAP_REPLICATION_LOG_KEEP_TIME:?"LDAP_REPLICATION_LOG_KEEP_TIME must be set when LDAP_REPLICATION_ENABLE is True"}


  # Enable Replication Log writing:
  "${ldapmodify[@]}" <<-EOLDIF
		dn: cn=changelog5,cn=config
		changetype: add
		objectclass: top
		objectclass: extensibleObject
		cn: changelog5
		nsslapd-changelogdir: ${LDAP_BASEDIR}/changelogdb
		nsslapd-changelogmaxage: ${LDAP_REPLICATION_LOG_KEEP_TIME}
	EOLDIF

  # Create the replication user
  "${ldapmodify[@]}" <<-EOLDIF
		dn: ${LDAP_REPLICATION_DN}
		changetype: add
		objectClass: simpleSecurityObject
		objectClass: organizationalRole
		cn: Replication
		userPassword: ${LDAP_REPLICATION_PASSWORD}
		description: Replication Manager
	EOLDIF

  # Enable the replication entrypoint
  "${ldapmodify[@]}" <<-EOLDIF
		dn: cn=replica,cn="${LDAP_SUFFIX}",cn=mapping tree,cn=config
		changetype: add
		objectclass: top
		objectclass: nsds5replica
		objectclass: extensibleObject
		cn: replica
		nsds5replicaroot: ${LDAP_SUFFIX}
		nsds5replicaid: ${LDAP_REPLICATION_INDEX}
		nsds5replicatype: 3
		nsds5flags: 1
		nsds5ReplicaPurgeDelay: ${LDAP_REPLICA_PURGE_DELAY}
		nsds5ReplicaBindDN: ${LDAP_REPLICATION_DN}
	EOLDIF

fi
