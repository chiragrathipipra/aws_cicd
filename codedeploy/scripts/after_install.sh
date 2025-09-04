#!/usr/bin/env bash
set -e
# Rename the jar to a constant name
if [ -f /opt/myapp/demo-0.0.1-SNAPSHOT.jar ]; then
  mv /opt/myapp/demo-0.0.1-SNAPSHOT.jar /opt/myapp/app.jar
fi

# Install/refresh systemd unit
# cp -f /opt/codedeploy-agent/deployment-root/deployment-*/deployment-*/codedeploy/application.service /etc/systemd/system/myapp.service || \
# cp -f $(pwd)/codedeploy/application.service /etc/systemd/system/myapp.service
cp -f /opt/myapp/application.service /etc/systemd/system/myapp.service

chmod 644 /etc/systemd/system/myapp.service
systemctl daemon-reload
systemctl enable myapp
chown -R ubuntu:ubuntu /opt/myapp
