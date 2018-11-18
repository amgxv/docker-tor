ARG ARCH=amd64
FROM ${ARCH}/ubuntu:18.04
LABEL maintainer="amgxv"

RUN apt-get update && apt-get install software-properties-common gnupg2 apt-transport-https -y && \
gpg2 --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 && \
gpg2 --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add - && \
add-apt-repository 'deb https://deb.torproject.org/torproject.org bionic main' && \ 
apt-get update && apt-get install tor python3-pip python3 python3-distutils -y && \
pip3 install nyx && \
apt remove software-properties-common python3-pip -y && apt autoclean -y && apt autoremove -y && \
rm -r /var/lib/apt/*
USER debian-tor

CMD /usr/bin/tor -f /etc/tor/torrc

