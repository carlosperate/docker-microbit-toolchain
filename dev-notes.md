# Developer docs

## Publish image

```
docker login ghcr.io -u <your_username>
docker images
docker tag IMAGE_ID ghcr.io/carlosperate/microbit-toolchain:VERSION
docker push ghcr.io/carlosperate/microbit-toolchain:VERSION
```
