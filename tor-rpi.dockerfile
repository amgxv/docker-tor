ARG ARCH=amd64
FROM ${ARCH}/ubuntu:18.04
MAINTAINER amgxv

RUN apt-get update && apt-get install tor python3-pip -y
RUN pip3 install nyx
USER debian-tor

CMD /usr/bin/tor -f /etc/tor/torrc

