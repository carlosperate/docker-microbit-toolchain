# Docker micro:bit Toolchain

Docker image with the micro:bit toolchain.

## Instructions

### Build docker image

Build the docker image:

```
docker build -t "microbit-toolchain" .
```

For better traceability it's good to save the build output, so preferably do:

### Run a bash session

Run a bash session (launches a new container) inside an existing docker image:

```
docker run --name microbit-toolchain-container -it --entrypoint /bin/bash microbit-toolchain
```

### Copy files from docker to host

```
docker cp microbit-toolchain-container:/home/artefacts .
```

### Publish image

```
docker login ghcr.io -u <your_username>
docker images
docker tag IMAGE_ID ghcr.io/carlosperate/microbit-toolchain:VERSION
docker push ghcr.io/carlosperate/microbit-toolchain:VERSION
```
