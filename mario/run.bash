#!/usr/bin/env bash

xhost +local:docker || true

docker run  -ti --rm \
            --user "$(id -u)" \
            -v "/run/user/$UID/pulse/native:/var/run/pulseaudio.sock" \
            -e "DISPLAY" \
            -e "QT_X11_NO_MITSHM=1" \
            -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
            --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
            -e XAUTHORITY \
            -v "/dev:/dev" \
            --device /dev/snd \
            --net=host \
            --privileged \
            --name mario mario \
            bash
