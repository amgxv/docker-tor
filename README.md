# dockerized-tor-relay
---

Run a Containerized Tor Relay.  
This container only includes the software to make it work.
You should give the configuration via docker / docker-compose and torrc file.

The torrc file included in this repository, has the main config to run a middle relay.


## Build
```
docker-build -t <maintainer>/<image>:<tag> -f dockerfile .
```



