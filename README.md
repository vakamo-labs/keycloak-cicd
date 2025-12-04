# CI/CD Image for Keycloak

A custom Keycloak Docker image designed for CI/CD environments with automatic realm import on startup and enhanced monitoring.

**🎯 Problem Solved**: Makes Keycloak usable as a service in GitHub Actions with optional realm import capability.

This hopefully becomes obsolete once either:
- [GitHub Actions suck](https://github.com/orgs/community/discussions/52675) [less](https://github.com/orgs/community/discussions/52675)

## Features

- Starts Keycloak in development mode with metrics and health endpoints enabled
- Optional realm import on startup via environment variable
- Custom entrypoint script for flexible configuration

## Usage

### Basic Usage

```bash
docker run -p 8080:8080 ghcr.io/vakamo-labs/keycloak-cicd:latest
```

### With Realm Import

Set the `KC_IMPORT_REALM_FILE` environment variable to automatically import a realm configuration on startup:

```bash
docker run -p 8080:8080 \
  -e KC_IMPORT_REALM_FILE=/opt/keycloak/data/import/realm.json \
  -v $(pwd)/realm.json:/opt/keycloak/data/import/realm.json \
  ghcr.io/vakamo-labs/keycloak-cicd:latest
```

### In Docker Compose

```yaml
services:
  keycloak:
    image: ghcr.io/vakamo-labs/keycloak-cicd:latest
    environment:
      - KC_IMPORT_REALM_FILE=/opt/keycloak/data/import/realm.json
    volumes:
      - ./realm.json:/opt/keycloak/data/import/realm.json
    ports:
      - "8080:8080"
```

### In GitHub Actions

```yaml
services:
  keycloak:
    image: ghcr.io/vakamo-labs/keycloak-cicd:latest
    env:
      KC_IMPORT_REALM_FILE: /opt/keycloak/data/import/realm.json
    ports:
      - 8080:8080
```

## Environment Variables

- `KC_IMPORT_REALM_FILE`: (Optional) Path to a realm JSON file to import on startup. If not set, no import is performed.
