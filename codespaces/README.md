# Codespaces image

- Template based on
  https://github.com/microsoft/vscode-dev-containers/tree/v0.146.0/container-templates
- common-debian.sh:
  https://github.com/microsoft/vscode-dev-containers/blob/v0.146.0/script-library/common-debian.sh


### Publish image

```
docker login ghcr.io -u <your_username>
docker images
docker tag IMAGE_ID ghcr.io/OWNER/IMAGE_NAME:VERSION
docker push ghcr.io/OWNER/IMAGE_NAME:VERSION
```
