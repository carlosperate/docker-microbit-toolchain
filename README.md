# Docker micro:bit Toolchain

Docker image with the micro:bit toolchain.

## Instructions

### Build docker image

Build the docker image:

```
docker build -t "ubit-toolchain-img" .
```

For better traceability it's good to save the build output, so preferably do:

### Run a bash session

Run a bash session (launches a new container) inside an existing docker image:

```
docker run --name ubit-toolchain-container -it --entrypoint /bin/bash ubit-toolchain-img
```

### Copy files from docker to host

```
docker cp ubit-toolchain-container:/home/artefacts .
```
