FROM openjdk:11.0.11-jdk-slim

# trino version will be passed in at build time
ARG TRINO_VERSION=362

RUN apt-get update
RUN apt-get install -y wget python less

RUN mkdir -p /etc
COPY trino-server-${TRINO_VERSION} /etc/trino-server-${TRINO_VERSION}
RUN ln -s /etc/trino-server-${TRINO_VERSION} /etc/trino

COPY etc /etc/trino/etc
COPY catalog /etc/trino/catalog

RUN mv /etc/trino/etc/worker-config.properties /etc/trino/etc/config.properties

COPY docker-entrypoint-worker.sh /etc/trino
RUN chmod +x /etc/trino/docker-entrypoint-worker.sh

ENTRYPOINT /etc/trino/docker-entrypoint-worker.sh