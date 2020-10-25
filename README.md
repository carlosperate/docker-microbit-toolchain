# Docker micro:bit Toolchain

Docker image with the micro:bit toolchain.

## Instructions

### Build docker image

Build the docker image:

```
docker build -t "ubit-toolchain" .
```

For better traceability it's good to save the build output, so preferably do:

### Run a bash session

Run a bash session (launches a new container) inside an existing docker image:

```
docker run --name ubit-toolchain-container -it --entrypoint /bin/bash ubit-toolchain
```

### Copy files from docker to host

```
docker cp ubit-toolchain-container:/home/artefacts .
```

### Publish image

```
docker login ghcr.io -u <your_username>
docker images
docker tag IMAGE_ID ghcr.io/carlosperate/ubit-toolchain:VERSION
docker push ghcr.io/carlosperate/ubit-toolchain:VERSION
```
