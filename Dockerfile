FROM ubuntu:bionic

ADD docker/apt/qgis-2017.gpg.key /etc/apt

RUN apt-get update && \
    apt-get install --yes \
    software-properties-common wget gpg && \
    apt-key add /etc/apt/qgis-2017.gpg.key

ADD docker/apt/qgis-ubuntu-bionic.list /etc/apt/sources.list.d

RUN apt-get update && \
    apt-get install --yes snapcraft

