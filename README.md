# Dockerized XNAT instance for the DDI project

This docker image is a simplified adaptation of the official [xnat-docker-compose](https://github.com/NrgXnat/xnat-docker-compose), taking only the xnat-web instance.
Until the need of using docker-compose, this instance is configured as follows:
- Based on tomcat9 image.
- XNAT-web latest version, retrieved from the bitbucket repo.
- Access to `durable/xnat`.
  - For simplicity host folders will mount at `/data/xnat`. The XNAT config file must point to this container paths.

Build the image executing the `buildxnat` script, where the specific `XNAT_VERSION` is set.

With this configuration, the docker command in TSD should be:
```bash
# load the image the first time
docker load -i ddi-xnat-${version}.tar.gz
# bind the xnat folder in durable
docker run xnat-web:${version} -v /tsd/p96/data/durable/xnat:/data/xnat
```

Once the container is working start/stop it with the regular docker command.
```bash
# Example with 1.8.2
docker start ddi/xnat:1.8.2
```
