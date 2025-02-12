#!/usr/bin/env bash

# evaluate CMD
if [[ $1 == "build_tiles" ]]; then
    valhalla_build_tiles -c /data/valhalla.json /data/map.pbf
elif [[ $1 == "service" ]]; then
    valhalla_service /data/valhalla.json 1
else
  echo "ERROR: Unrecognized cmd '$1'"
  exit 1
fi