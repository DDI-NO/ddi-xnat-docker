# Dockerized XNAT instance for the DDI project

This docker image is a simplified adaptation of the official [xnat-docker-compose](https://github.com/NrgXnat/xnat-docker-compose), taking only the xnat-web instance.
Until the need of using docker-compose, this instance is configured as follows:
- Based on tomcat9 image.
- XNAT-web latest version, retrieved from the bitbucket repo.
- Access to `durable/xnat`.

Build the image executing the `buildxnat` script, where the specific `XNAT_VERSION` is set.

## Managing XNAT docker instance
In TSD, docker runs in the machine *p96-docker-l*. The first step is to ssh:
```bash
ssh p96-docker-l
```

### First deployment
The built image must be placed in `durable/xnat/docker images`, so p96-tsdfx user can acces it. Then load the image with the command:
```bash
sudo -u p96-tsdfx /usr/bin/docker load -i /tsd/p96/data/durable/xnat/docker images/ddi_xnat_xxx.tar.gz
```
After loading the image, in order to do the first run, use the script `/tsd/p96/data/no-backup/scripts/bin/runxnatdocker`:

### Deployed container

Once the container is working, call start/stop with the regular docker command.
```bash
sudo -u p96-tsdfx /usr/bin/docker start xnat
```
To inspect the live tomcat output from the container run
```bash
sudo -u p96-tsdfx /usr/bin/docker logs -f xnat
```
