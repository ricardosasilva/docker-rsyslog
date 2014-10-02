FROM dockerfile/supervisor

RUN apt-get update -q

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy rsyslog

ADD rsyslog/rsyslog.conf /etc/

# Run rsyslog using supervisor
ADD supervisor/conf.d/ /etc/supervisor/conf.d/

ADD run.sh /usr/local/bin/run.sh

VOLUME ["/etc/rsyslog.d/",]

CMD ["/bin/sh", "-e", "/usr/local/bin/run.sh"]