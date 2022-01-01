FROM openjdk:11.0.11-jdk-slim

# trino version will be passed in at build time
ARG TRINO_VERSION=362

RUN apt-get update
RUN apt-get install -y wget python less

RUN mkdir -p /opt
COPY trino-server-${TRINO_VERSION} /opt/trino-server-${TRINO_VERSION}
RUN ln -s /opt/trino-server-${TRINO_VERSION} /opt/trino

COPY etc /opt/trino/etc
COPY catalog /opt/trino/catalog
COPY password.db /opt/trino/password.db
COPY jmx /opt/trino/jmx
COPY certs /opt/trino/certs

RUN mv /opt/trino/etc/coordinator-config.properties /opt/trino/etc/config.properties

COPY docker-entrypoint.sh /opt/trino
RUN chmod +x /opt/trino/docker-entrypoint.sh

USER root

ADD ranger-2.1.0-trino-plugin /opt/ranger-2.1.0-trino-plugin/

ADD enable-trino-plugin.sh /opt/ranger-2.1.0-trino-plugin/
ADD install.properties /opt/ranger-2.1.0-trino-plugin/
ADD docker-entrypoint.sh /opt/ranger-2.1.0-trino-plugin/

ENTRYPOINT /opt/trino/docker-entrypoint.sh