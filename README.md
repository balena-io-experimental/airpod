Airpod
======

This is a [balena][balena-io] application you can deploy to your
[Raspberry Pi][raspberry] and turn it to an [AirPlay][airplay] target that
can stream audio to any Hi-Fi setup via the analogue output.

Under the hood, it uses the excellent [shairport-sync][shairport-sync] project.

[balena-io]: https://www.balena.io/
[raspberry]: https://raspberrypi.org/
[airplay]: https://www.apple.com/airplay/
[shairport-sync]: https://github.com/mikebrady/shairport-sync


Requirements
------------

- A Raspberry Pi 2 or 3
- An analogue audio setup such as an amplifier and speakers
- Appropriate analogue Mini-jack to RCA or Phono cable

You can then target this setup and stream audio from any AirPlay-capable
device, version either 1 or 2 (most iOS, tvOS and macOS devices)


Installation
------------

**IMPORTANT**: The Raspberry Pi will send a loud click out its analogue output
when the audio device is started or shut down. That usually means, the first
time an AirPlay client connects and starts streaming and on reboot or shutdown.
Watch out or this can fry your equipment.

Clone this repository locally to your computer:

    $ git clone https://github.com/balena-io-playground/airpod.git

Follow the [Getting Started guide][getting-started] to provision your device
and deploy this project with Resin.io.

### Configuration

Use the [Dashboard][dashboard] to configure the app.

On the "Fleet Configuration" page, add a new entry:

  - `BALENA_HOST_CONFIG_audio_pwm_mode`: 2

On the "Environment Variables" page of *each device*, add the following entries:

  - `AIRPOD_NAME`: the name you want the device to advertise itself as.
  - `AIRPOD_PASS`: a password that should be provided by clients targeting this
    device for playback.

[dashboard]: https://dashboard.balena-cloud.com/
[getting-started]: https://www.balena.io/docs/raspberrypi3/nodejs/getting-started/


TODO
----

- Report playback events to the Dashboard
- Integrate wifi-connect: https://github.com/balena-io/wifi-connect


License
-------

Copyright 2017-2019 Balena Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
