FROM ubuntu:bionic

RUN apt-get update -qq && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:team-gcc-arm-embedded/ppa && \
    apt-get update -qq && \
    apt-get install -y git python3-pip gcc-arm-embedded build-essential cmake ninja-build srecord

RUN echo 'alias python=python3' >> ~/.bashrc && \
    python3 -m pip install yotta

WORKDIR /home/
