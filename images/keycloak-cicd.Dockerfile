ARG BASE_IMAGE=quay.io/keycloak/keycloak:latest
FROM ${BASE_IMAGE}

CMD [ "start-dev", "--metrics-enabled=true", "--health-enabled=true", "--import-realm" ]
