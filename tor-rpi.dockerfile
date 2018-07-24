FROM ubuntu:18.04
MAINTAINER amgxv

RUN apt-get update && apt-get install tor python3 python3-pip -y
RUN pip3 install --no-cache-dir nyx
RUN apt-get remove python3-pip -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/etc/apt
USER debian-tor

CMD /usr/bin/tor -f /etc/tor/torrc
