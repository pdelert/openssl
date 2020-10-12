FROM alpine:edge

MAINTAINER Piotr Delert (https://github.com/pdelert)

RUN apk update && \
  apk add --no-cache openssl && \
  rm -rf /var/cache/apk/*
RUN apk add zip

ENTRYPOINT ["openssl"]
