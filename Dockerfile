FROM ubuntu:18.04

RUN mkdir /etc/ssh/ \
 && cd /etc/ssh; touch sshd_config ssh_host_dsa_key ssh_host_dsa_key.pub ssh_host_ecdsa_key ssh_host_ecdsa_key.pub ssh_host_ed25519_key ssh_host_ed25519_key.pub ssh_host_rsa_key ssh_host_rsa_key.pub

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      dnsutils \
      iproute2 \
      net-tools \
      netcat-openbsd \
      openssh-server \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /var/run/sshd \
 && chmod 0755 /var/run/sshd \
 && rm /etc/ssh/ssh_* \
 && echo -e 'nameserver 127.0.0.1\noptions ndots:0\n' > /etc/resolv.conf

CMD [ "/usr/sbin/sshd", "-D" ]
