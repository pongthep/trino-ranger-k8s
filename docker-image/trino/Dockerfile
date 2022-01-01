FROM trinodb/trino:362

USER root

ADD ranger-2.1.0-trino-plugin /opt/ranger-2.1.0-trino-plugin/

ADD enable-trino-plugin.sh /opt/ranger-2.1.0-trino-plugin/
ADD install.properties /opt/ranger-2.1.0-trino-plugin

RUN /opt/ranger-2.1.0-trino-plugin/enable-trino-plugin.sh

RUN chmod 777 /data/trino

USER trino

ENTRYPOINT ["/usr/lib/trino/bin/run-trino"]