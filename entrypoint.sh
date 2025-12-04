#!/bin/bash
set -e

# Import realm if KC_IMPORT_REALM_FILE is set
if [ -n "${KC_IMPORT_REALM_FILE}" ]; then
  echo "Waiting for realm file: ${KC_IMPORT_REALM_FILE}"
  
  # Wait for file to exist (max 60 seconds, check every 5 seconds)
  MAX_WAIT=60
  WAIT_INTERVAL=5
  elapsed=0
  
  while [ ! -f "${KC_IMPORT_REALM_FILE}" ] && [ $elapsed -lt $MAX_WAIT ]; do
    echo "File not found yet, waiting... (${elapsed}s/${MAX_WAIT}s)"
    sleep $WAIT_INTERVAL
    elapsed=$((elapsed + WAIT_INTERVAL))
  done
  
  if [ -f "${KC_IMPORT_REALM_FILE}" ]; then
    echo "Importing realm from: ${KC_IMPORT_REALM_FILE}"
    /opt/keycloak/bin/kc.sh import --file "${KC_IMPORT_REALM_FILE}"
  else
    echo "Warning: Realm file not found after ${MAX_WAIT} seconds, skipping import"
  fi
fi

# Start Keycloak in development mode with metrics and health enabled
echo "Starting Keycloak..."
exec /opt/keycloak/bin/kc.sh start-dev --metrics-enabled=true --health-enabled=true
