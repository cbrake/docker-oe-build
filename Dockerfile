FROM debian:jessie
MAINTAINER Cliff Brake <cbrake@bec-systems.com>

RUN apt-get update && \
	apt-get install -yq sudo build-essential git \
	  python man bash diffstat gawk chrpath wget cpio \
	  texinfo lzop apt-utils bc screen && \
	rm -rf /var/lib/apt-lists/* && \
	echo "dash dash/sh boolean false" | debconf-set-selections && \
	DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN addgroup --gid 1003 osdev && \
        useradd -u 1006 -g 1003 -ms /bin/bash build && \
	usermod -aG sudo build
	
USER build
WORKDIR /home/build

