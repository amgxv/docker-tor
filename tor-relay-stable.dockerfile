ARG ARCH=amd64
FROM ${ARCH}/debian:stable-slim
MAINTAINER amgxv

RUN apt-get update && apt-get install tor python3-pip python3 python3-distutils -y && \
pip3 install nyx && \
apt remove python3-pip -y && apt autoclean -y && apt autoremove -y && \
rm -r /var/lib/apt/*
USER debian-tor

CMD /usr/bin/tor -f /etc/tor/torrc

