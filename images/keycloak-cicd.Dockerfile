ARG BASE_IMAGE=quay.io/keycloak/keycloak:latest
FROM ${BASE_IMAGE}

COPY --chmod=755 entrypoint.sh /opt/keycloak/bin/entrypoint.sh

ENTRYPOINT ["/opt/keycloak/bin/entrypoint.sh"]
