FROM alpine

MAINTAINER Piotr Delert (https://github.com/pdelert)

RUN apk update && \
  apk add --no-cache openssl && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["openssl"]
