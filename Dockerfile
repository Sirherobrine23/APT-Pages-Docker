FROM ubuntu:latest
# By Sh23
LABEL maintainer="srherobrine20@gmail.com"
LABEL description="Aptly publish Github/Gitlab pages"
# Install reprepro and more
RUN apt update -qq && DEBIAN_FRONTEND=noninteractive apt install -y gnupg wget git curl screen ubuntu-server dos2unix && apt clean && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/aptly-dev/aptly/releases/download/v1.4.0/aptly_1.4.0_amd64.deb -O /tmp/aptly.deb && dpkg -i /tmp/aptly.deb
RUN mkdir -p /aptly
# Add scripts
ADD publish.sh /usr/sbin/publish
ADD key.sh /usr/sbin/key
ADD publish_reprepro.sh /usr/sbin/publish_reprepro
ADD remove_reprepro.sh /usr/sbin/remove_reprepro
# Convertendo de CRLF to LF
RUN dos2unix /usr/sbin/publish
RUN dos2unix /usr/sbin/key
RUN dos2unix /usr/sbin/publish_reprepro
RUN dos2unix /usr/sbin/remove_reprepro
# Dando as Permissões
RUN chmod a+x /usr/sbin/publish
RUN chmod a+x /usr/sbin/key
RUN chmod a+x /usr/sbin/publish_reprepro
RUN chmod a+x /usr/sbin/remove_reprepro
# Usuario ROOT
USER root
