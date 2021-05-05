FROM cm2network/steamcmd:root

LABEL maintainer=docker-rw@devidian.de

RUN apt update && apt upgrade -y && \
    apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common -y && \
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    apt update && \
    mkdir -p /usr/share/man/man1 && \
    apt install adoptopenjdk-8-hotspot -y

COPY entrypoint.sh /root/

ENTRYPOINT /root/entrypoint.sh