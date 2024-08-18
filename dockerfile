FROM ubuntu:latest

RUN apt update -y \
    && apt install -y git ttyd vim python3 python3-pygments \
    && apt autoremove -y \
    && apt autoclean -y \
    && rm -rf /var/lib/apt/lists/*

RUN cd /srv \
    && git clone https://github.com/RafaelFino/learn-ops-content 

WORKDIR /srv/learn-ops-content/src

EXPOSE 8080

ENTRYPOINT [ "/srv/learn-ops-content/ttyd-server.sh" ]