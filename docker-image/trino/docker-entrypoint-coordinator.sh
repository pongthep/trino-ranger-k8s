#!/bin/bash

#echo "node.id="$(cat /proc/sys/kernel/random/uuid) >> /etc/trino/etc/node.properties

#echo "discovery.uri=http://$DISCOVERT_HOST:8080" >> /etc/trino/etc/config.properties

etc/ranger-2.1.0-trino-plugin/enable-trino-plugin.sh && /etc/trino/bin/launcher run