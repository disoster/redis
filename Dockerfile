ARG DEBIAN
FROM gcc:13.1.0-$DEBIAN as builder
ARG VERSION
ENV VERSION $VERSION
WORKDIR /build

RUN wget https://github.com/redis/redis/archive/${VERSION}.tar.gz && tar -xzvf ${VERSION}.tar.gz && rm -rf ${VERSION}.tar.gz

WORKDIR /build/redis-${VERSION}

RUN make

FROM debian:$DEBIAN-slim

ARG VERSION

COPY --from=builder /build/redis-$VERSION/src/redis-server /redis-server
COPY --from=builder /build/redis-$VERSION/src/redis-cli /redis-cli
