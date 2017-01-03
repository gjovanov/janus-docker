# About

-   This image contains the janus webrtc gateway from meetecho ([https://github.com/meetecho/janus-gateway](https://github.com/meetecho/janus-gateway))

-   It uses the stun server from google

-   This repository is published at [https://hub.docker.com/r/gjovanov/janus-docker/
](https://hub.docker.com/r/gjovanov/janus-docker/)

## Limitations

Disables RabbitMQ, MQTT, Oxygen Documentation

SSL/crypto library:        OpenSSL
DataChannels support:      yes
Recordings post-processor: yes
TURN REST API client:      yes
Doxygen documentation:     no
Transports:
    REST (HTTP/HTTPS):     yes
    WebSockets:            yes (new API)
    RabbitMQ:              no
    MQTT:                  no
    Unix Sockets:          yes
Plugins:
    Echo Test:             yes
    Streaming:             yes
    Video Call:            yes
    SIP Gateway:           yes
    Audio Bridge:          yes
    Video Room:            yes
    Voice Mail:            yes
    Record&Play:           yes
    Text Room:             yes


## Build

`docker build -t efacilitation/docker-janus-webrtc-gateway`

## Ports

| Port   | Description          |
|--------|----------------------|
| 8081   | HTML-Examples        |
| 8088   | RESTful API          |
| 8089   | Secure RESTful API   |
| 8188   | WebSocket API        |
| 8189   | Secure WebSocket API |


## Environment variables

No environment variables are needed for this image.

## Linked Containers

This container does not need any container linked to.

## Run

`docker run -d -p 8081:8081 \
	-p 7088:7088 -p 7889:7889 \
	-p 7188:7188 -p 7988:7988 \
	-p 8088:8088 -p 8089:8089 \
	-p 8188:8188 -p 8189:8189 \
        -p 10000-10200:10000-10200 \
	gjovanov/janus-docker:latest`
