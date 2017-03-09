FROM centos:7

RUN yum update -y && yum install -y 389-ds-base && yum clean all

COPY ./entrypoint.sh /
COPY ./entrypoint.d/ /entrypoint.d/

VOLUME /etc/dirsrv

# disable starting of server via systemd
RUN sed -i '/if (@errs = startServer($inf))/,/}/d' /usr/lib64/dirsrv/perl/*
# remove systemd files as they make the script run "systemctl daemon-reload" which fails
RUN rm -fr /usr/lib/systemd/system;
# remove selinux policy change as they make the script run the policy change
RUN sed -i 's/updateSelinuxPolicy($inf);//g' /usr/lib64/dirsrv/perl/*
# remove hostname check
RUN sed -i 's/checkHostname {/checkHostname {\nreturn();/g' /usr/lib64/dirsrv/perl/DSUtil.pm


ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "ns-slapd -D $LDAP_BASEDIR -d 0" ]
