#!/bin/bash

# This script setups the basic 389DS install and starts the server in background (will be restarted in foreground later)


# generate the setup-script configuration
cat > /setup.${LDAP_HOSTNAME}.inf <<- EOF

		[General]
		SuiteSpotUserID= nobody
		SuiteSpotGroup= nobody
		AdminDomain= localhost
		ConfigDirectoryAdminID= admin
		ConfigDirectoryAdminPwd= $LDAP_ROOT_PASSWORD
		FullMachineName= $LDAP_HOSTNAME

		[slapd]
		ServerPort= 389
		RootDN= $LDAP_ROOT_DN
		RootDNPwd= $LDAP_ROOT_PASSWORD
		Suffix= $LDAP_SUFFIX
		SlapdConfigForMC= Yes
		UseExistingMC= 0 

EOF

# setup 389ds
setup-ds.pl --silent --file=/setup.${LDAP_HOSTNAME}.inf --debug

# start 389ds in the background
ns-slapd -D ${LDAP_BASEDIR} -d 0 &

sleep 1
