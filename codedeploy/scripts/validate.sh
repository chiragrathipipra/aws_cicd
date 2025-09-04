#!/usr/bin/env bash
set -e
# Wait a few seconds and validate HTTP
sleep 5
curl -sf http://localhost:8080/ >/dev/null
