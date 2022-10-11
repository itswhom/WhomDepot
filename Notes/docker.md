# Docker Notes

 * <a href="#sample-dockerfile">Sample Dockerfile</a>
 * <a href="#build-image">Build Image</a>

## Sample Dockerfile
Create a file called `Dockerfile` used when setting up the image:

``` dockerfile
# start from an image on docker hub
FROM ubuntu:jammy

# making var/arg
ARG proxy=http://proxyserver.net:1234

# add environment var referencing above var
ENV http_proxy=$proxy

#running commands in terminal
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y cmake make git

# copy a folder from repo to docker filesystem
COPY requirements.txt ./requirements.txt

# install python packages
RUN pip install \
  numpy \
  pytest

# default command to run
CMD ["bash"]
```

## Terminal Commands
[Build image](https://docs.docker.com/engine/reference/commandline/build/) from `./Dockerfile` using a given name/tag, where tags are kind of like git branches:
``` bash
docker build -t imagename:tag .
```

[Create a volume](https://docs.docker.com/engine/reference/commandline/volume_create/) that can be mounted to containers:
``` bash
docker volume create myvolume
```

Using `run`, [create and start a new container](https://docs.docker.com/engine/reference/commandline/run/) using the image and volume created above:
``` bash
docker run -it -v myvolume:/mounthere imagename
```
  > Use -d in the run options to start with it detached. If you do this, you can attach to it with:
  > ``` bash
  > docker attach [containerid]
  > ```


