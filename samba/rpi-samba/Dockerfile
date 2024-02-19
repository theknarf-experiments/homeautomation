#Samba share for Raspberry Pi
FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install --no-install-recommends -y \
 samba-common-bin \
 samba \
 supervisor

RUN mkdir -p /config /shared
COPY *.conf /config/

VOLUME /shared

EXPOSE 445

ENV SAMBA_PASSWORD=""

COPY run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
