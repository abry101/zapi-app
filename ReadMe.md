docker ps ------------------------------ List Only running containers
docker ps -a ------------------------------ List all containers.
docker rm <container-name/ID> -f ------------------------------ Remove container by force.
docker rm <container-name/ID> -fv ------------------------------ Remove container by force with their assocaited volume.
docker logs <container-name/ID> ------------------------------ Shows the log of the container
docker exec -it <container-name/ID> bash ------------------------------ Loging in to the container for linux
docker exec -it <container-name/ID> /bin/sh ------------------------------ Loging in to the container for window

docker images ------------------------------ List Images
docker image ls ------------------------------ List Images
docker image ls -a------------------------------ List All Images
docker image rm <image-name/ID> ------------------------------ Removing Image
docker image rm -f <image-name/ID> ------------------------------ Removing Image by force

docker volume ls ------------------------------ List volume
docker volume rm <volume-name> ------------------------------ Removing Volume
docker volume prune <volume-name> ------------------------------ Removing all Volume
docker volume rm -f <volume-name> ------------------------------ Removing Volume by force

docker build <Dockerfile-location e.g. "."> -------------------- Building Image without name
docker build <Dockerfile-location> -t <image-name> -------------------- Building Image with name

docker run [OPTIONS] <image-name> [ARGS] --------------------------- Creating Container
[OPTIONS]
--name <name-container> ----------------------------- Assign a name to the container
-d | --detach ---------------------- Run container in background and print container ID
-e | --env <env-name>=<env-value> ----------------------- Set environment variables // -e PORT=5000
--env-file <env-file-locatoin> ----------------------- Read in a file of environment variables // --env-file ./.env
-p | --publish <host-port>:<container-port>----------------------- Publish a container's port(s) to the host // -p 80:80  
 -P | --publish-all ----------------------- Publish all exposed ports to random ports
--read-only ----------------------- Mount the container's root filesystem as read only
--rm ----------------------- Automatically remove the container when it exits
-u | --user <container-username> ----------------------- Username or UID (format: <name|uid>[:<group|gid>])
-h | --hostname <container-hostname> ----------------------- Container host name
-v | --volume <host-volume>:<container-volume> ----------------------- Bind mount a volume
-v $(pwd)/src:/app/src ---- linux & Mac
-v %cd%/src:/app/src ---- Window cmd
-v ${PWD}/src:/app/src ---- Window poweshell

        -v | --volume <host-volume>:<container-volume>:ro -------------------- Bind mount a volume, & the container volume is readonly
        -v | --volume <container-volume> ----------------------- This setup prevent the binding on the specified volume of the container
                    -v /app/node_modules

        --volumes-from <container-ID> ----------------------- Mount volumes from the specified container(s)
        -w | --workdir <new-working-path> ----------------------- Working directory inside the container  // -w /usr/local/app

docker compose [OPTIONS] [COMMANDS]
[OPTIONS]:
--env-file string -------------------------------------- Specify an alternate environment file.
-f, --file string -------------------------------------- Specify a single or multiple compose file
--project-directory string ---------------------------- Specify an alternate working directory (default: the path of ` the, first specified, Compose file)
-p, --project-name string -------------------------------------- Project name

[COMMANDS]:
up -------------------------------------- Create and start containers
down -------------------------------------- Stop and remove containers, networks
start -------------------------------------- Start services
stop -------------------------------------- Stop services
restart -------------------------------------- Restart service containers
build -------------------------------------- Build or rebuild services
exec -------------------------------------- Execute a command in a running container.
kill -------------------------------------- Force stop service containers.
rm -------------------------------------- Removes stopped service containers
port -------------------------------------- Print the public port for a port binding.
logs -------------------------------------- View output from containers
ls -------------------------------------- List running compose projects
ps -------------------------------------- List containers
run -------------------------------------- Run a one-off command on a service.

docker compose up -d ------------------------- except if its a first time create and start containers from cached images
docker compose up -d -p <project-name> -------- same here except for the name
docker compose up -d --build ------------------ same except here we force an image rebuild
docker compose -f docker-compose.yml -f docker-compose.dev.yml -p <project-name> up -d --build
docker compose -f docker-compose.yml -f docker-compose.dev.yml -p <project-name> down

hasura console --envfile <relative-path-envfile>
hasura console --envfile ../utils/development.env
hasura console --envfile production.env

https://via.placeholder.com/150.png
https://via.placeholder.com/150/000000/FFFFFF/?text=Dummy+Image.net
