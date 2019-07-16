ARG ARCH=amd64
FROM ${ARCH}/debian:9.8-slim
MAINTAINER amgxv

RUN apt-get update && apt-get install tor tor-arm procps -y && \
apt autoclean -y && apt autoremove -y && \
rm -r /var/lib/apt/*
USER debian-tor

CMD /usr/bin/tor -f /etc/tor/torrc
