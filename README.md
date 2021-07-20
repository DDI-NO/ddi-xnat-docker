# Dockerized XNAT instance for the DDI project

This docker image is a simplified adaptation of the official [xnat-docker-compose](https://github.com/NrgXnat/xnat-docker-compose), taking only the xnat-web instance.
Until the need of using docker-compose, this instance is configured as follows:
- Based on tomcat9 image.
- XNAT-web latest version, retrieved from the bitbucket repo.
- Access to `durable/xnat`.

Build the image executing the `buildxnat` script, where the specific `XNAT_VERSION` is set.

After loading the built image in TSD, in order to run use the script `/tsd/p96/data/no-backup/scripts/bin/runxnatdocker`:

Once the container is working start/stop it with the regular docker command.
```bash
docker start xnat
```
