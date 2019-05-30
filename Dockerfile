FROM centos:latest
add phddns-3.0.2.x86_64.rpm /tmp/phddns-3.0.2.x86_64.rpm
ENV ORAY_HOME /usr/local/oray
RUN rpm -ivh /tmp/phddns-3.0.2.x86_64.rpm && rm -rf /tmp/* \
    && yum install -y epel-release \
    && yum install -y supervisor
ADD supervisord.conf /supervisord.conf
COPY /supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 6060
CMD ["/usr/bin/supervisord"]
