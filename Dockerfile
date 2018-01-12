FROM ubuntu:17.10

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openssh-server \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /var/run/sshd \
 && chmod 0755 /var/run/sshd

CMD [ "/usr/sbin/sshd", "-D" ]
