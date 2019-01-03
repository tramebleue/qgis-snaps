# QGIS snap

This project creates a working snap of QGIS (www.qgis.org).
QGIS is a Geographic Information System (GIS) that supports vector, raster & database formats.

Only AMD64 versions of QGis are currently available.

## Versions of QGis

Tagged versions of the Snapcraft configuration file :

* [3.4 (Madeira)](https://github.com/tramebleue/qgis-snaps/tree/3.4.3)
* [3.2 (Bonn)](https://github.com/tramebleue/qgis-snaps/tree/3.2.2)
* [3.0 (Girona)](https://github.com/tramebleue/qgis-snaps/tree/3.0.0)
* [2.18 (Las Palmas)](https://github.com/tramebleue/qgis-snaps/tree/2.18.15)
* [2.14 (Essen)](https://github.com/tramebleue/qgis-snaps/tree/2.14.22)

## Building the snap

On an Ubuntu system a snap can be built out of the `snapcraft.yaml` by running `snapcraft` in the project directory.

For a clean, system independent build it is recommanden to use the official `snapcore/snapcraft` Docker image.
Using Docker, you’ll map the current directory into the container and then build the snap from that same directory:

```
docker build -t snapcraft-ubuntugis .
docker run -v $PWD:$PWD -w $PWD snapcraft-ubuntugis bash -c "apt update && apt upgrade -y && snapcraft clean && snapcraft"
```
