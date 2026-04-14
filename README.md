# Useful Commands

## Installing a new npm package

```bash
docker exec -it dan-dan-web /bin/bash
npm install <NEW_PACKAGE>
```

## Rebuidling web container

```bash
docker compose -f dev.compose.yml build --no-cache
docker compose -f dev.compose.yml up
```

## Logging into backend shell

```bash
docker compose -f dev.compose.yml exec backend bash
```
