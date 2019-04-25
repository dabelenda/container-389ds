FROM centos:7

RUN mkdir -p /etc/dirsrv ; chmod 0770 /etc/dirsrv
RUN yum update -y && yum install -y 389-ds-base openssl && yum clean all

COPY ./entrypoint.sh /
COPY ./entrypoint.d/ /entrypoint.d/

# disable starting of server via systemd
RUN sed -i '/if (@errs = startServer($inf))/,/}/d' /usr/lib64/dirsrv/perl/*
# remove systemd files as they make the script run "systemctl daemon-reload" which fails
RUN rm -fr /usr/lib/systemd/system;
# remove selinux policy change as they make the script run the policy change
RUN sed -i 's/updateSelinuxPolicy($inf);//g' /usr/lib64/dirsrv/perl/*
# remove hostname check
RUN sed -i 's/checkHostname {/checkHostname {\nreturn();/g' /usr/lib64/dirsrv/perl/DSUtil.pm

# OpenShift compat, allow adding username to current user if group is root
RUN mkdir -p /var/lock/dirsrv /var/run/dirsrv ; chmod 0770 /etc/passwd /etc/group /var/lib/dirsrv /var/log/dirsrv /usr/lib64/dirsrv /var/lock/dirsrv /etc/dirsrv /var/run/dirsrv
# Fix
RUN sed s/"\\s* chown "/"# chown "/g -i /usr/lib64/dirsrv/perl/*
RUN sed s/"\\s* chmod "/"# chmod "/g -i /usr/lib64/dirsrv/perl/*

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "ns-slapd -D $LDAP_BASEDIR -d 0" ]
