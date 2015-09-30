#!/bin/bash
if [ ! -f config.yaml ]; then
  node /opt/docker-sinopia/config_gen.js
  sed -e 's/\#listen\: localhost/listen\: 0.0.0.0/' /tmp/config.yaml > /opt/docker-sinopia/config.yaml
fi
cat /opt/docker-sinopia/config.yaml
node /opt/docker-sinopia/node_modules/sinopia/bin/sinopia --config /opt/docker-sinopia/config.yaml
