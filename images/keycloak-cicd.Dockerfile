ARG BASE_IMAGE=quay.io/keycloak/keycloak:latest
FROM ${BASE_IMAGE}

COPY entrypoint.sh /opt/keycloak/bin/entrypoint.sh
RUN chmod +x /opt/keycloak/bin/entrypoint.sh

ENTRYPOINT ["/opt/keycloak/bin/entrypoint.sh"]
