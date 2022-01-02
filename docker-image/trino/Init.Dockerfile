FROM openjdk:11.0.11-jdk-slim

# trino version will be passed in at build time
ARG TRINO_VERSION=362

RUN apt-get update
RUN apt-get install -y wget python less

ADD trino-server-${TRINO_VERSION} /opt/trino-server-${TRINO_VERSION}
RUN ln -s /opt/trino-server-${TRINO_VERSION} /opt/trino
RUN mkdir /etc/trino

ADD etc /opt/trino/etc
ADD catalog /opt/trino/catalog

RUN mv /opt/trino/etc/coordinator-config.properties /opt/trino/etc/config.properties

COPY docker-entrypoint.sh /opt/trino
RUN chmod +x /opt/trino/docker-entrypoint.sh

COPY init-bash.sh /opt/trino

ADD ranger-2.1.0-trino-plugin /opt/ranger-2.1.0-trino-plugin/
RUN mkdir /etc/ranger-2.1.0-trino-plugin