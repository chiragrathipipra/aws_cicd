#!/usr/bin/env bash
set -e

URL="http://localhost:8080/"
MAX_TRIES=30
SLEEP_TIME=2

echo "Validating application on $URL"

for i in $(seq 1 $MAX_TRIES); do
  if curl -sf "$URL" >/dev/null; then
    echo "Application is UP!"
    exit 0
  fi
  echo "[$i/$MAX_TRIES] Application not yet ready, retrying..."
  sleep $SLEEP_TIME
done

echo "Application failed to start in time."
exit 1


# #!/usr/bin/env bash
# set -e
# # Wait a few seconds and validate HTTP
# sleep 5
# curl -sf http://localhost:8080/ >/dev/null
