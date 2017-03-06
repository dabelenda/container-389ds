FROM centos:7

RUN yum update -y && yum install -y 389-ds-base && yum clean all

COPY ./entrypoint.sh /
COPY ./entrypoint.d/ /entrypoint.d/

VOLUME /etc/dirsrv

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "ns-slapd -D $LDAP_BASEDIR -d 0" ]
