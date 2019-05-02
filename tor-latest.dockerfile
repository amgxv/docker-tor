ARG ARCH=amd64
FROM ${ARCH}/ubuntu:18.04
LABEL maintainer="amgxv"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install software-properties-common gnupg2 apt-transport-https curl -y && \
curl https://deb.torproject.org/torproject.org/pool/main/d/deb.torproject.org-keyring/deb.torproject.org-keyring_2018.08.06_all.deb -o dab.deb && \
dpkg -i dab.deb && \
add-apt-repository 'deb https://deb.torproject.org/torproject.org bionic main' && \
apt-get update && \
apt-get install tor python3-pip python3 python3-distutils python3-pkg-resources -y && \
pip3 --no-cache-dir install nyx && \
apt-get remove software-properties-common python3-pip curl gnupg2 apt-transport-https -y && \
apt-get autoclean -y && \
apt-get autoremove -y && \
rm -r /var/lib/apt/* && \
rm dab.deb
USER debian-tor

CMD /usr/bin/tor -f /etc/tor/torrc

