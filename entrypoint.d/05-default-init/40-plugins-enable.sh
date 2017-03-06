#!/bin/bash

if [ x"${LDAP_PLUGIN_ENABLE_ACCOUNT_POLICY}" == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=Account Policy,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x"${LDAP_PLUGIN_ENABLE_ATTRIBUTE_UNIQUENESS}" == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=attribute uniqueness,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x"${LDAP_PLUGIN_ENABLE_DISTRIBUTED_NUMBERIC_ASSIGNMENT}" == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=Distributed Numeric Assignment Plugin,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x"${LDAP_PLUGIN_ENABLE_MEMBEROF}" == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=MemberOf Plugin,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x"${LDAP_PLUGIN_ENABLE_PAM_PASS_THROUGH_AUTH}" == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=PAM Pass Through Auth,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x"${LDAP_PLUGIN_ENABLE_PASS_THROUGH_AUTH}" == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=Pass Through Authentication,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x${LDAP_PLUGIN_ENABLE_POSIX_WINSYNC_API} == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=Posix Winsync API,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x${LDAP_PLUGIN_ENABLE_REFERENTIAL_INTEGRITY_POSTOPERATION} == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=referential integrity postoperation,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x${LDAP_PLUGIN_ENABLE_RETRO_CHANGELOG} == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=Retro Changelog Plugin,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x${LDAP_PLUGIN_ENABLE_CONTENT_SYNCHRONIZATION} == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		# Force enable of the retrochange plugin
		dn: cn=Retro Changelog Plugin,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
		
		dn: cn=Content Synchronization,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x${LDAP_PLUGIN_ENABLE_ROOTDN_ACCESS_CONTROL} == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=RootDN Access Control,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x${LDAP_PLUGIN_ENABLE_SPACE_INSENSITIVE_STRING} == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=Space Insensitive String Syntax,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x${LDAP_PLUGIN_ENABLE_URI_SYNTAX} == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=URI Syntax,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi

if [ x${LDAP_PLUGIN_ENABLE_USN} == x"True" ]; then
	"${ldapmodify[@]}" <<-EOF
		dn: cn=USN,cn=plugins,cn=config
		changetype: modify
		replace: nsslapd-pluginEnabled
		nsslapd-pluginEnabled: on
	EOF
fi
