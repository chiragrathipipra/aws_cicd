#!/usr/bin/env bash
set -e
systemctl stop myapp || true
mkdir -p /opt/myapp
rm -f /opt/myapp/app.jar || true
