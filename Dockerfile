FROM ubuntu:rolling

MAINTAINER Piotr Delert (https://github.com/pdelert)

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
COPY openssl-3.0.0-alpha6.conf /etc/ld.so.conf.d/openssl-3.0.0-alpha6.conf
RUN apt-get update && apt-get upgrade -y
RUN apt install build-essential checkinstall zlib1g-dev wget -y
RUN wget -r https://www.openssl.org/source/openssl-3.0.0-alpha6.tar.gz && tar -xvf www*/source/*.tar.gz
RUN cd openssl-3.0.0-alpha6 && ./Configure --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib && make && make install
RUN ldconfig -v
RUN mv /usr/bin/openssl /usr/bin/openssl.backup
ENV PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/ssl/bin"

RUN rm -rf www* && rm -rf openssl* && apt-get  --purge remove -y wget
RUN which openssl
RUN openssl version -a

#ENTRYPOINT ["openssl"]
