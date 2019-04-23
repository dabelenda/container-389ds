mkdir $LDAP_BASEDIR/tmp
mkfifo $LDAP_BASEDIR/tmp/nsslapd-accesslog
if [ `id -u` == 0 ]; then
  chown $LDAP_RUN_USER $LDAP_BASEDIR/tmp/nsslapd-accesslog
fi

mkfifo $LDAP_BASEDIR/tmp/nsslapd-auditlog
if [ `id -u` == 0 ]; then
  chown $LDAP_RUN_USER $LDAP_BASEDIR/tmp/nsslapd-auditlog
fi

mkfifo $LDAP_BASEDIR/tmp/nsslapd-auditfaillog
if [ `id -u` == 0 ]; then
  chown $LDAP_RUN_USER $LDAP_BASEDIR/tmp/nsslapd-auditfaillog
fi

mkfifo $LDAP_BASEDIR/tmp/nsslapd-errorlog
if [ `id -u` == 0 ]; then
  chown $LDAP_RUN_USER $LDAP_BASEDIR/tmp/nsslapd-errorlog
fi

cd $LDAP_BASEDIR/tmp

tail --quiet -f * &
