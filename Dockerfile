FROM ubuntu:bionic

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository -y ppa:team-gcc-arm-embedded/ppa && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends git gcc-arm-embedded build-essential cmake ninja-build srecord && \
    apt-get install -y python3-pip && \
    apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip --no-cache-dir install --upgrade pip && \
    python3 -m pip --no-cache-dir install yotta && \
    # python3 -m pip cache purge && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

WORKDIR /home/
