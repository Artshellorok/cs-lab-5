FROM ubuntu:lucid

ENV PULSE_SERVER=unix:/var/run/pulseaudio.sock

RUN sed -i 's/archive/old-releases/' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    apt-utils \
    mesa-utils \
    unzip \
    build-essential \
    nano \
    && rm -rf /var/lib/apt/lists/*
        
RUN mkdir -p /var/lib/apt/lists/partial && apt-get update && apt-get install -y build-essential libsdl-dev \
                        libsdl-image* \
                        libsdl-mixer* \
                        libsdl-ttf* \
                        libsdl-gfx* \
                        wget \
                        freetype*

COPY ./MegaMario_v1.7_full.zip /MegaMario_v1.7_full.zip

RUN unzip MegaMario_v1.7_full.zip -d MegaMario_v1.7_full

RUN sed -i "s/PATH_MAX/1024/g" /MegaMario_v1.7_full/src/Global.h

RUN apt-get install -y alsa-base alsa-utils alsa-tools libpulse0 libasound2 libasound2-plugins libsndfile1-dev

COPY alsa.conf /usr/share/alsa/alsa.conf

RUN cd MegaMario_v1.7_full && make PREFIX=/usr && make PREFIX=/usr install
