ARG ARCH=amd64
FROM ${ARCH}/debian:stable-slim
MAINTAINER amgxv

RUN apt-get update && apt-get install tor nyx procps -y && \
apt autoclean -y && apt autoremove -y && \
rm -r /var/lib/apt/* && \
echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc

USER debian-tor

CMD /usr/bin/tor -f /etc/tor/torrc
