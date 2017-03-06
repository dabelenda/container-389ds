mkdir $LDAP_BASEDIR/tmp
mkfifo $LDAP_BASEDIR/tmp/nsslapd-accesslog
chown dirsrv $LDAP_BASEDIR/tmp/nsslapd-accesslog

mkfifo $LDAP_BASEDIR/tmp/nsslapd-auditlog
chown dirsrv $LDAP_BASEDIR/tmp/nsslapd-auditlog

mkfifo $LDAP_BASEDIR/tmp/nsslapd-auditfaillog
chown dirsrv $LDAP_BASEDIR/tmp/nsslapd-auditfaillog

mkfifo $LDAP_BASEDIR/tmp/nsslapd-errorlog
chown dirsrv $LDAP_BASEDIR/tmp/nsslapd-errorlog

cd $LDAP_BASEDIR/tmp

tail --quiet -f * &
