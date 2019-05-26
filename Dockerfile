FROM ubuntu:latest
add phddns.deb /tmp/hddns.deb
ENV ORAY_HOME /usr/local/oray
RUN mkdir -p ${ORAY_HOME} \
    && mkdir -p /tmp/ \
    && dpkg -i /tmp/hddns.deb && rm /tmp/hddns.deb \
    && apt-get update && apt-get install -y supervisor
ADD supervisord.conf /supervisord.conf
COPY /supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 6060
CMD ["/usr/bin/supervisord"]
