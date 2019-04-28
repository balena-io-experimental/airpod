#!/bin/bash

touch /etc/shairport-sync.conf
cat > /etc/shairport-sync.conf <<EOF
general = {
  name = "${AIRPOD_NAME}";
  password = "${AIRPOD_PASS}";
  volume_range_db = 30;
  drift_tolerance_in_seconds = 0.010;
};
metadata = {
  enabled = "yes";
  include_cover_art = "no";
  pipe_name = "/tmp/shairport-sync-metadata";
  pipe_timeout = 5000;
};
EOF

echo 'wireless-power off' >>/etc/network/interfaces

update-rc.d shairport-sync defaults 90 10
update-rc.d shairport-sync enable

service dbus start || exit 'Failed to start dbus'
sleep 1
service avahi-daemon start || exit 'Failed to start avahi'
sleep 1
service shairport-sync start || exit 'Failed to start shairport-sync'
sleep 3

echo "Started. Advertising server as '${AIRPOD_NAME}'"

while true; do
  /usr/local/bin/shairport-sync-metadata-reader < /tmp/shairport-sync-metadata
  echo "ERROR ($?): Reading metadata failed; retrying in 10 seconds..."
  sleep 10
done
