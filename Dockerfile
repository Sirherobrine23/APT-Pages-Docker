FROM ubuntu:latest
# By Sh23
LABEL maintainer="srherobrine20@gmail.com"
LABEL description="Aptly publish Github/Gitlab pages"
# Install reprepro and more
RUN apt update -qq && DEBIAN_FRONTEND=noninteractive apt install -y gnupg wget git curl screen ubuntu-server dos2unix && apt clean
RUN wget -qO - https://www.aptly.info/pubkey.txt -O /tmp/pubkey.txt && apt-key add /tmp/pubkey.txt
RUN echo "deb http://repo.aptly.info/ nightly main" > /etc/sources.list.d/aptly.list 
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y aptly
# Add scripts
ADD publish.sh /usr/sbin/publish
ADD key.sh /usr/sbin/key
ADD publish_reprepro.sh /usr/sbin/publish_reprepro
ADD remove_reprepro.sh /usr/sbin/remove_reprepro
ADD reprepro_export.sh /usr/sbin/reprepro_export
# Convertendo de CRLF to LF
RUN dos2unix /usr/sbin/publish
RUN dos2unix /usr/sbin/key
RUN dos2unix /usr/sbin/publish_reprepro
RUN dos2unix /usr/sbin/remove_reprepro
RUN dos2unix /usr/sbin/reprepro_export
# Dando as Permissões
RUN chmod a+x /usr/sbin/publish
RUN chmod a+x /usr/sbin/key
RUN chmod a+x /usr/sbin/publish_reprepro
RUN chmod a+x /usr/sbin/remove_reprepro
RUN chmod a+x /usr/sbin/reprepro_export
# Usuario ROOT
USER root
