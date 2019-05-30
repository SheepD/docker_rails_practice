​ # README

This is a sample Rails application from Docker for Rails Developers (PragProg).
It was generated using Docker without Ruby installed on the local machine.
We're using the app to discover the wonderful world of Rails with Docker. 

## TODO When building a rails docker app

* create `Dockerfile`
* create `.dockerignore`
* create `docker-compose.yml`
* add `STDOUT.sync = true` to top of `config/boot.rb`
* 

## Docker Cheatsheet

```
$ docker run [options] [image] [command for image]
```

### options
* `-v $PWD:/place/to/mount/to` - mount volume

## docker-compose cheatsheet

# DEMO CHEATSHEET

List docker machines
```
$ docker-machine ls
```

Creating a DO Manager
```
$ docker-machine create \
  --driver digitalocean \
  --digitalocean-access-token $DIGITAL_OCEAN_TOKEN \
  --digitalocean-region sgp1 \
  do-manager-1
```

Creating a DO Worker
```
$ docker-machine create \
  --driver digitalocean \
  --digitalocean-access-token $DIGITAL_OCEAN_TOKEN \
  --digitalocean-region sgp1 \
  do-worker-1
```

Initialize Docker Swarm Manager
```
$ docker swarm init --advertise-addr MANAGER_IP
# Save the output
```

Initialize Docker Swarm Worker
```
$ docker swarm join --token TOKEN MANAGER_IP:2377

# to do it via ssh by docker-machine

$ docker-machine ssh YOUR_WORKER \
  "docker swarm join --token TOKEN MANAGER_IP:2377"
```

Stopping a machine
```
$ docker-machine stop MACHINE
```

Removing a machine
```
$ docker-machine rm MACHINE
```
