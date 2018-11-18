ARG ARCH=amd64
FROM ${ARCH}/python:3.6.7-slim
MAINTAINER amgxv

RUN apt-get update && apt-get install tor python3-pip python3 -y && \
pip3 install nyx && \
apt remove python3-pip -y && apt autoclean -y && apt autoremove -y && \
rm -r /var/lib/apt/*
USER debian-tor

CMD /usr/bin/tor -f /etc/tor/torrc

