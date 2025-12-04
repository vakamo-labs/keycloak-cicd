#!/bin/bash
set -e

# Import realm if KC_IMPORT_REALM_FILE is set
if [ -n "${KC_IMPORT_REALM_FILE}" ]; then
  echo "Importing realm from: ${KC_IMPORT_REALM_FILE}"
  /opt/keycloak/bin/kc.sh import --file "${KC_IMPORT_REALM_FILE}"
fi

# Start Keycloak in development mode with metrics and health enabled
echo "Starting Keycloak..."
exec /opt/keycloak/bin/kc.sh start-dev --metrics-enabled=true --health-enabled=true
