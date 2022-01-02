FROM openjdk:11.0.11-jdk-slim

# trino version will be passed in at build time
ARG TRINO_VERSION=362

RUN apt-get update
RUN apt-get install -y wget python less

ENTRYPOINT /etc/trino/docker-entrypoint-coordinator.sh