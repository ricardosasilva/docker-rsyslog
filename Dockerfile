FROM dockerfile/supervisor

RUN apt-get update -q

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy rsyslog

ADD rsyslog.conf /etc/

# Run rsyslog using supervisor
ADD supervisor/conf.d/rsyslog.conf /etc/supervisor/conf.d/

ADD run.sh /usr/local/bin/run

VOLUME ["/etc/rsyslog.d/",]

CMD ["/bin/sh", "-e", "/usr/local/bin/run"]