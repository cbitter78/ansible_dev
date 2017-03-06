# Ansible Container

This is a Docker Container that is loaded with the tools you will need to work with ansible. 

Of course you will need docker to run this.  You can get docker [here](https://download.docker.com/mac/stable/Docker.dmg)

## Building

```shell

make build
```

### Running

This will mount your home folder under /$USER and will copy your .ssh folder under /root/.ssh
so you can interact with git.  You can also edit files on your computer and access them in the 
container via the /%USER folder.

```shell
docker run --rm -ti --env=DOCKER_USER=$USER --volume $PWD:/`basename $PWD` --volume ~/:/$USER cbitter78/ansible_dev:1.0.1-0
```

or

```shell
make run

```


