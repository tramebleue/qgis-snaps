FROM snapcore/snapcraft

ADD docker/apt/qgis-ubuntugis-xenial.list /etc/apt/sources.list.d

RUN apt-get update && \
    apt-get install --yes \
    software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key CAEB3DC3BDF7FB45 && \
    add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update

