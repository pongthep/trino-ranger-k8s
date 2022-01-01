#!/bin/bash

echo "node.id="$(cat /proc/sys/kernel/random/uuid) >> /opt/trino/etc/node.properties

echo "discovery.uri=http://$DISCOVERT_HOST:8080" >> /opt/trino/etc/config.properties

/opt/ranger-2.1.0-trino-plugin/enable-trino-plugin.sh

/opt/trino/bin/launcher run