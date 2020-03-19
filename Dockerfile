FROM ubuntu:eoan

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS=yes

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install \
        sshpass \
        python3 \
        python3-pip \
    && apt-get clean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m pip install --upgrade pip \
    && python3 -m pip install ansible

WORKDIR /workdir