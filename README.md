# bedrock-server

## How to use.

### Build docker image.
```
podman build -t bedrock-server:<version> --build-arg VERSION='<version>' .
```

### Run minecraft dedicated server.
```
docker run -d -p 19132:19132/udp bedrock-server:<version>