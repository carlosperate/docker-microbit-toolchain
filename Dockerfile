FROM ubuntu:bionic

# Installing arm gcc, build tools, python and git
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository -y ppa:team-gcc-arm-embedded/ppa && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends git gcc-arm-embedded build-essential srecord && \
    apt-get install -y --no-install-recommends python3 python3-setuptools python3-pip && \
    apt-get remove -y software-properties-common && \
    apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Installing Yotta, Cmake, and Ninja
COPY requirements.txt /home/
RUN python3 -m pip --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install -r /home/requirements.txt && \
    rm /home/requirements.txt && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

WORKDIR /home/
