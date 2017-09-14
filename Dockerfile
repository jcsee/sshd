FROM ubuntu:16.04

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openssh-server \
 && rm -rf /var/lib/apt/lists/*