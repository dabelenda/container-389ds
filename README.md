LDAP Server
===========

This repository contains an image.

This image runs a single [LDAP server](http://directory.fedoraproject.org/).

## Requirements

For the LDAP server to run correctly some variables are required:

- *LDAP_HOSTNAME*: the hostname of this ldap server
- *LDAP_BASEDIR*: the basedir of the ldap (only change if you know what you are doing)
- *LDAP_ROOT_DN*: the DN of the root "user"
- *LDAP_ROOT_PASSWORD*: the password for the Root DN "user"
- *LDAP_SUFFIX*: the suffix to use for the root database

## Replication

This image has variables to enable replication from one instance to another. They are as follows:

- *LDAP_REPLICATION_ENABLE*: set to "True" to enable the replication
- *LDAP_REPLICATION_INDEX*: replication index of this instance, defaults to asking rancher-metadata service for the index of this container (must be unique in the cluster)
- *LDAP_REPLICATION_DN*: the DN used for authenticating replication
- *LDAP_REPLICATION_PASSWORD*: the Password for the replication DN
- *LDAP_REPLICA_PURGE_DELAY*: delay after which to forget a non-responding node
- *LDAP_REPLICATION_LOG_KEEP_TIME*: time to keep the change log

## Schema

A Schema definition can be inserted into the ldap server using *LDAP_EXTRA_SCHEMA_DEFS* which must contain a valid schema definition as per [the documentation](https://access.redhat.com/documentation/en-US/Red_Hat_Directory_Server/10/html/Administration_Guide/custom-schema-files.html).

## Plugins

389ds has a plugin system that allows to enable additionnal features. Some variable are used to enable these features at start time:

- *LDAP_PLUGIN_ENABLE_ACCOUNT_POLICY*: set to "True" to enable Account Policy plugin
- *LDAP_PLUGIN_ENABLE_ATTRIBUTE_UNIQUENESS*: set to "True" to enable Attribute Uniqueness plugin
- *LDAP_PLUGIN_ENABLE_DISTRIBUTED_NUMBERIC_ASSIGNMENT*: set to "True" to enable Distributed Numeric Assignment plugin
- *LDAP_PLUGIN_ENABLE_MEMBEROF*: set to "True" to enable MemberOf plugin
- *LDAP_PLUGIN_ENABLE_PAM_PASS_THROUGH_AUTH*: set to "True" to enable PAM Pass-Through Auth plugin
- *LDAP_PLUGIN_ENABLE_PASS_THROUGH_AUTH*: set to "True" to enable Pass-Through Auth plugin
- *LDAP_PLUGIN_ENABLE_POSIX_WINSYNC_API*: set to "True" to enable Posix Winsync API plugin
- *LDAP_PLUGIN_ENABLE_REFERENTIAL_INTEGRITY_POSTOPERATION*: set to "True" to enable Referential Integrity Post-Operation plugin
- *LDAP_PLUGIN_ENABLE_RETRO_CHANGELOG*: set to "True" to enable Retro Changelog plugin
- *LDAP_PLUGIN_ENABLE_CONTENT_SYNCHRONIZATION*: set to "True" to enable Content Synchronization plugin (implicitely enables Retro Changelog)
- *LDAP_PLUGIN_ENABLE_ROOTDN_ACCESS_CONTROL*: set to "True" to enable RootDN Access Control plugin
- *LDAP_PLUGIN_ENABLE_SPACE_INSENSITIVE_STRING*: set to "True" to enable Space Insensitive String plugin
- *LDAP_PLUGIN_ENABLE_URI_SYNTAX*: set to "True" to enable URI Syntax plugin
- *LDAP_PLUGIN_ENABLE_USN*: set to "True" to enable USN plugin
