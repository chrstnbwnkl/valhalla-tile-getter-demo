# Valhalla: Pull Tiles over HTTP

Tiny example that shows how to use a static file server for pulling in missing tiles as needed.

## Setup

### Build tiles

```sh
docker compose up valhalla_build_tiles
```

### Spin up Valhalla and File Server

```sh
docker compose up -d
```
