#!/bin/bash

if [[ -z "$AIRPOD_DEVICE_NAME" ]]; then
  AIRPOD_DEVICE_NAME=$(printf "airpod %s" $(hostname | cut -c -4))
fi

if [[ -z "$AIRPORD_PASSWORD" ]]; then
  exec shairport-sync -a "$AIRPOD_DEVICE_NAME" | printf "Device is discoverable as \"%s\"\n" "$AIRPOD_DEVICE_NAME"
else
  exec shairport-sync -a "$AIRPOD_DEVICE_NAME" --password=$AIRPORD_PASSWORD | printf "Device is discoverable as \"%s\"\n" "$AIRPOD_DEVICE_NAME"
fi
