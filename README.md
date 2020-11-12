# Docker micro:bit Toolchain

Docker image with the micro:bit toolchain.

![docker-microbit](https://user-images.githubusercontent.com/4189262/99010611-3445f000-2542-11eb-90d8-0983d37de762.png)

Useful to be able to compile C/C++ programmes using DAL or CODAL.
This includes projects like MicroPython.

Also includes a Docker image ready to be used with
GitHub Codespaces](https://github.com/features/codespaces) and build your
micro:bit projects on the cloud.

![codespaces](https://user-images.githubusercontent.com/4189262/99011128-48d6b800-2543-11eb-89a7-738ff64e379a.png)


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
