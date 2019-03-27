# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        openjdk:8-jre-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN apt-get update \
 && apt-get install curl ca-certificates openssl git tar sqlite fontconfig tzdata \
 && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
