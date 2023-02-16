> ## Container
>
> - docker ps ------------------------------ List Only running containers
> - docker ps -a ------------------------------ List all containers
> - docker rm <container-name/ID> -f ------------------------------ Remove container by force
> - docker rm <container-name/ID> -fv ------------------------------ Remove container by force with their assocaited volume
> - docker logs <container-name/ID> ------------------------------ Shows the log of the container
> - docker exec -it <container-name/ID> bash ------------------------------ Loging in to the container for linux
> - docker exec -it <container-name/ID> /bin/sh ------------------------------ Loging in to the container for window  
>   <br/><br/>

<br/>

> ## Image
>
> - docker images ------------------------------ List Images
> - docker image ls ------------------------------ List Images
> - docker image ls -a------------------------------ List All Images
> - docker image rm <image-name/ID> ------------------------------ Removing Image
> - docker image rm -f <image-name/ID> ------------------------------ Removing Image by force  
>   <br><br>

<br/>

> ## Volume
>
> - docker volume ls ------------------------------ List volume
> - docker volume rm <volume-name> ------------------------------ Removing Volume
> - docker volume prune <volume-name> ------------------------------ Removing all Volume
> - docker volume rm -f <volume-name> ------------------------------ Removing Volume by force  
>   <br><br>

<br/>

> - ## Building Image
> - docker build <Dockerfile-location e.g. "."> -------------------- Building Image without name
> - docker build <Dockerfile-location> -t <image-name> -------------------- Building Image with name  
>   <br>
> - docker run [OPTIONS] <image-name> [ARGS] --------------------------- Creating Container  
>   <br>
> - [OPTIONS]<br>
>   - --name <name-container> ----------------------------- Assign a name to the container<br>
>   - -d | --detach ---------------------- Run container in background and print container ID<br>
>   - -e | --env <env-name>=<env-value> ----------------------- Set environment variables // -e PORT=5000<br>
>   - --env-file <env-file-locatoin> ----------------------- Read in a file of environment variables // --env-file ./.env<br>
>   - -p | --publish <host-port>:<container-port>----------------------- Publish a container's port(s) to the host // -p 80:80 <br>
>   - -P | --publish-all ----------------------- Publish all exposed ports to random ports<br>
>   - --read-only ----------------------- Mount the container's root filesystem as read only<br>
>   - --rm ----------------------- Automatically remove the container when it exits<br>
>   - -u | --user <container-username> ----------------------- Username or UID (format: <name|uid>[:<group|gid>])<br>
>   - -h | --hostname <container-hostname> ----------------------- Container host name
>   - -v | --volume <host-volume>:<container-volume> ----------------------- Bind mount a volume<br>
>     <code>
>   - e.g. + -v \$(pwd)/src:/app/src ---- linux & Mac <br> + -v \%cd%/src:/app/src ---- Window cmd<br> + -v \${PWD}/src:/app/src ---- Window poweshell<br>
>     </code>
>     <br>
>   - -v | --volume <host-volume>:<container-volume>:ro -------------------- Bind mount a volume, & the container volume is readonly<br>
>   - -v | --volume <container-volume> ----------------------- This setup prevent the binding on the specified volume of the container ` -v /app/node_modules`<br>
>   - --volumes-from <container-ID> ----------------------- Mount volumes from the specified container(s)<br>
>   - -w | --workdir <new-working-path> ----------------------- Working directory inside the container // -w /usr/local/app<br>

<br/>

---

<br/>

> ## Docker Compose
>
> - **docker compose [OPTIONS] [COMMANDS]**<br>
> - \[OPTIONS]:<br>
>   - --env-file string -------------------------------------- Specify an alternate environment file.<br>
>   - -f, --file string -------------------------------------- Specify a single or multiple compose file<br>
>   - --project-directory string ----------------------------- Specify an alternate working directory (default: the path of ` the, first specified, Compose file)<br>
>   - -p, --project-name string ------------------------------ Project name<br>
>     <br>
> - \[COMMANDS]:<br>
>   - up -------------------------------------- Create and start containers<br>
>   - down -------------------------------------- Stop and remove containers, networks<br>
>   - start -------------------------------------- Start services<br>
>   - stop -------------------------------------- Stop services<br>
>   - restart -------------------------------------- Restart service containers<br>
>   - build -------------------------------------- Build or rebuild services<br>
>   - exec -------------------------------------- Execute a command in a running container.<br>
>   - kill -------------------------------------- Force stop service containers.<br>
>   - rm -------------------------------------- Removes stopped service containers<br>
>   - port -------------------------------------- Print the public port for a port binding.<br>
>   - logs -------------------------------------- View output from containers<br>
>   - ls -------------------------------------- List running compose projects<br>
>   - ps -------------------------------------- List containers<br>
>   - run -------------------------------------- Run a one-off command on a service.<br>
>     <br>

docker compose up -d ------------------------- except if its a first time create and start containers from cached images<br>
docker compose up -d -p <project-name> -------- same here except for the name<br>
docker compose up -d --build ------------------ same except here we force an image rebuild<br>
docker compose -f docker-compose.yml -f docker-compose.dev.yml -p <project-name> up -d --build<br>
docker compose -f docker-compose.yml -f docker-compose.dev.yml -p <project-name> down<br>
<br>
hasura console --envfile <relative-path-envfile><br>
hasura console --envfile ../utils/development.env<br>
hasura console --envfile production.env<br>
<br>
https://via.placeholder.com/150.png<br>
https://via.placeholder.com/150/000000/FFFFFF/?text=Dummy+Image.net<br>
