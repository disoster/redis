# redis
Minimal redis docker image

## How to build image
```
docker build --build-arg VERSION=7.0.11 --build-arg DEBIAN=bookworm -t 'disoster/redis:7.0.11-bookworm-slim' .
```

## How to use image
start a redis instance
```
$ docker run --name some-redis -d /redis-server
```
connecting via redis-cli
```
$ docker run -it --network some-network --rm redis /redis-cli -h some-redis
```
## License
The Dockerfile of the image is MIT licensed.

As with all Docker images, images contain software that may be under different licenses.
