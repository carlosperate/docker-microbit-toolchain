# Docker micro:bit Toolchain

Docker image with the micro:bit toolchain.

![docker-microbit](https://user-images.githubusercontent.com/4189262/99010611-3445f000-2542-11eb-90d8-0983d37de762.png)

Useful to be able to compile C/C++ programmes using DAL or CODAL.
This includes projects like MicroPython.

Also includes a Docker image ready to be used with
[GitHub Codespaces](https://github.com/features/codespaces) and build your
micro:bit projects on the cloud.

![codespaces](https://user-images.githubusercontent.com/4189262/99011128-48d6b800-2543-11eb-89a7-738ff64e379a.png)


## How to use this Docker image to build your micro:bit project

The docker image is hosted in the
[GitHub Container Registry](https://github.blog/2020-09-01-introducing-github-container-registry/)
and can be fetch with this command:

```
docker pull ghcr.io/carlosperate/microbit-toolchain:master
```

You can find more info about the image here:
https://github.com/users/carlosperate/packages/container/package/microbit-toolchain

To use this image in your project you can run a container from this image
following this format:

```
docker run -v $(pwd):/home --rm <image_name>:<image_version> <build_command>
```

Where:
- `-v $(pwd):/home` flag mounts your current working directory as a volume
  inside the docker container `/home` path
- `--rm` flag will clean up the container created for the build
- `<image_name>:<image_version>` is the image you want to use to create the
  container, if you've built this image locally from the Dockerfile in this
  repository you can use whatever name you've given it, or you can download the images from this repository using
  `ghcr.io/carlosperate/microbit-toolchain:latest`
- `<build_command>` should be replaced with whatever build command is needed for
  your project. For example, for a CODAL project that would be `python build.py`
  ([info in their README](https://github.com/lancaster-university/microbit-v2-samples/tree/v0.2.11#building))

### Example: DAL

The build steps from this example have been obtained from the
[project README](https://github.com/lancaster-university/microbit-samples/blob/v2.1.1/README.md).

```bash
$ git clone https://github.com/lancaster-university/microbit-samples
$ cd microbit-samples
$ docker run -v $(pwd):/home --rm ghcr.io/carlosperate/microbit-toolchain:latest yotta build
```

### Example: CODAL

The build steps from this example have been obtained from the
[project README](https://github.com/lancaster-university/microbit-v2-samples/blob/v0.2.11/README.md).

```bash
$ git clone https://github.com/lancaster-university/microbit-v2-samples.git
$ cd microbit-v2-samples
$ docker run -v $(pwd):/home --rm ghcr.io/carlosperate/microbit-toolchain:latest python build.py
```

### Example: MicroPython V1

The build steps from this example have been obtained from the
[project README](https://github.com/bbcmicrobit/micropython/blob/v1.0.1/README.md).

```bash
$ git clone https://github.com/bbcmicrobit/micropython.git
$ cd micropython
# First we prepare the project, this initial docker command only has to be run once
$ docker run -v $(pwd):/home --rm ghcr.io/carlosperate/microbit-toolchain:latest yt target bbc-microbit-classic-gcc-nosd && yt up
# Now we are ready to build
$ docker run -v $(pwd):/home --rm ghcr.io/carlosperate/microbit-toolchain:latest make all
```

### Example: MicroPython V2

The build steps from this example have been obtained from the
[project README](https://github.com/microbit-foundation/micropython-microbit-v2/blob/v2.0.0-beta.1/README.md).

```bash
$ git clone https://github.com/microbit-foundation/micropython-microbit-v2.git
$ cd micropython-microbit-v2
$ git submodule update --init
# First we prepare the project, this initial docker command only has to be run once
$ docker run -v $(pwd):/home --rm ghcr.io/carlosperate/microbit-toolchain:latest make -C lib/micropython/mpy-cross
# Now we are ready to build. In this case since we need a shell command (cd) we need to run it with bash
$ docker run -v $(pwd):/home --rm ghcr.io/carlosperate/microbit-toolchain:latest bash -c "cd src && make"
```

## How to use this Docker Image with GitHub Codespaces

This section of the docs is still a WIP.


## Other General Docker Instructions

### Build docker image

Build the docker image:

```
docker build -t "microbit-toolchain" .
```

### Run a bash session

Run a bash session (launches a new container) from an existing docker image:

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
