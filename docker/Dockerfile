FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install --yes \
    software-properties-common wget gpg net-tools netcat

# If host is running squid-deb-proxy on port 8000, populate /etc/apt/apt.conf.d/30proxy
# By default, squid-deb-proxy 403s unknown sources, so apt shouldn't proxy ppa.launchpad.net
RUN (route -n | awk '/^0.0.0.0/ {print $2}' > /tmp/host_ip.txt) \
  && echo "HEAD /" | nc `cat /tmp/host_ip.txt` 8000 | grep squid-deb-proxy \
  && (echo "Acquire::http::Proxy \"http://$(cat /tmp/host_ip.txt):8000\";" > /etc/apt/apt.conf.d/30proxy) \
  && (echo "Acquire::http::Proxy::ppa.launchpad.net DIRECT;" >> /etc/apt/apt.conf.d/30proxy) \
  || echo "No squid-deb-proxy detected on docker host"

ADD apt/qgis-2017.gpg.key /etc/apt
ADD apt/qgis-ubuntu-bionic.list /etc/apt/sources.list.d

RUN apt-key add /etc/apt/qgis-2017.gpg.key \
    && apt-get update \
    && apt-get install --yes snapcraft

