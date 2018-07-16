FROM osixia/openldap:1.2.1

COPY enable_monitor.sh /container/service/slapd/enable_monitor.sh

RUN sed -i -e /log-helper\ info\ \"Stop\ OpenLDAP...\"/i\ "/container/service/slapd/enable_monitor.sh" /container/service/slapd/startup.sh
