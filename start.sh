#!/bin/bash

set -e

touch shairport-sync.conf
cat > shairport-sync.conf <<EOF
general = {
  name = "${AIRPOD_NAME}";
  password = "${AIRPOD_PASS}";
  volume_range_db = 30;
  drift_tolerance_in_seconds = 0.010;
};
EOF

echo 'wireless-power off' >>/etc/network/interfaces

systemctl enable shairport-sync
systemctl start shairport-sync

# wait a bit for shairport to start
sleep 5

echo "Started. Advertising server as '${AIRPOD_NAME}'"

while true; do
  # poll shairport's status and exit if it has exited.
  systemctl status shairport-sync >/dev/null 2>&1
  sleep 10
done
