#!/bin/bash

set -e

touch /etc/shairport-sync.conf
cat > /etc/shairport-sync.conf <<EOF
general = {
  name = "${AIRPOD_NAME}";
  password = "${AIRPOD_PASS}";
  volume_range_db = 30;
  drift_tolerance_in_seconds = 0.010;
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
  # poll shairport's status and exit if it has exited.
  service shairport-sync status >/dev/null 2>&1
  sleep 10
done
