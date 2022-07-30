ARG ARCH=amd64
FROM ${ARCH}/ubuntu:jammy AS BUILDER
LABEL maintainer="amgxv"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install software-properties-common gnupg2 apt-transport-https curl -y && \
curl https://deb.torproject.org/torproject.org/pool/main/d/deb.torproject.org-keyring/deb.torproject.org-keyring_2022.04.27.1_all.deb -o dab.deb && \
dpkg -i dab.deb && \
add-apt-repository 'deb https://deb.torproject.org/torproject.org jammy main' && \
apt-get update && \
apt-get install tor python3-pip python3 python3-distutils python3-pkg-resources -y && \
pip3 --no-cache-dir install nyx && \
apt-get remove software-properties-common python3-pip curl gnupg2 apt-transport-https -y

FROM ${ARCH}/ubuntu:jammy as TOR
COPY --from=BUILDER dab.deb dab.deb
COPY --from=BUILDER /usr/bin/python3.10 /usr/bin/python3.10
COPY --from=BUILDER /usr/local/lib/python3.10/dist-packages/ /usr/local/lib/python3.10/dist-packages/
COPY --from=BUILDER /usr/local/bin/nyx /usr/local/bin/nyx
RUN dpkg -i dab.deb && apt update && apt install tor -y
RUN ln -s /usr/bin/python3.10 /usr/bin/python3
RUN echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc
USER debian-tor

CMD /usr/bin/tor -f /etc/tor/torrc

