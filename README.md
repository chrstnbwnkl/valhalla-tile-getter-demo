# Valhalla: Pull Tiles over HTTP

Tiny example that shows how to use a static file server for pulling in missing tiles as needed.
Does not work with the tar extract, but you can gzip the individual tiles on the file server and use `mjolnir.tile_url_gz` on the service side to request the gzipped files.

## Setup

### Build tiles

```sh
docker compose up valhalla_build_tiles
```

### Spin up Valhalla and File Server

```sh
docker compose up -d
```

Check that the `tile_dir` mapped to Valhalla's service is empty:

```sh
ll service_data/tiles
```

Run a small route request:

```sh
curl --request POST \
  --url http://localhost:8002/route \
  --header 'Content-Type: application/json' \
  --data '{
	"locations": [
		{
			"lon": 6.711466,
			"lat": 0.374734
		},
		{
                        "lon": 6.708205,
                        "lat": 0.372299
                      }
	],
	"costing": "auto"
}'
```

You should get a valid route response. Now check again for the service's `tile_dir` and you'll see the needed tiles.

## What to look out for when configuring Valhalla like this

- the parameter `mjolnir.tile_url` should contain `{tilePath}`, which Valhalla will replace with the relative path to the tile
- set `loki.use_connectivity` to false
