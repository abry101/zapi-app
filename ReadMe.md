> ## 1. Container
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

---

<br/>

> ## 2. Image
>
> - docker images ------------------------------ List Images
> - docker image ls ------------------------------ List Images
> - docker image ls -a------------------------------ List All Images
> - docker image rm <image-name/ID> ------------------------------ Removing Image
> - docker image rm -f <image-name/ID> ------------------------------ Removing Image by force  
>   <br><br>

<br/>

---

<br/>

> ## 3. Volume
>
> - docker volume ls ------------------------------ List volume
> - docker volume rm <volume-name> ------------------------------ Removing Volume
> - docker volume prune <volume-name> ------------------------------ Removing all Volume
> - docker volume rm -f <volume-name> ------------------------------ Removing Volume by force  
>   <br><br>

<br/>

---

<br/>

> ## 4. Building Image
>
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

            e.g.
                -v $(pwd)/src:/app/src ---- linux & Mac
                -v %cd%/src:/app/src ---- Window cmd
                -v ${PWD}/src:/app/src ---- Window poweshell"

> - -v | --volume <host-volume>:<container-volume>:ro -------------------- Bind mount a volume, & the container volume is readonly<br>
> - -v | --volume <container-volume> ----------------------- This setup prevent the binding on the specified volume of the container ` -v /app/node_modules`<br>
> - --volumes-from <container-ID> ----------------------- Mount volumes from the specified container(s)<br>
> - -w | --workdir <new-working-path> ----------------------- Working directory inside the container // -w /usr/local/app<br>

<br/>

---

<br/>

> ## 5. Docker Compose
>
> - **docker compose [OPTIONS] [COMMANDS]**<br>
> - \[OPTIONS]:<br>
>   - --env-file string -------------------------------------- Specify an alternate environment file.<br>
>   - -f, --file string -------------------------------------- Specify a single or multiple compose file<br>
>   - --project-directory string ----------------------------- Specify an alternate working directory (default: the path of ` the, first specified, Compose file)<br>
>   - -p, --project-name string ------------------------------ Project name<br> > <br>
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
>   - run -------------------------------------- Run a one-off command on a service.<br><br>

<br/>

---

<br/>

> ## 6. Docker Compose Examples
>
> - docker compose up -d<br>
> - docker compose up -d -p \<project-name> <br>
> - docker compose up -d --build
>   <br><br>
> - docker compose -f docker-compose.yml -f docker-compose.dev.yml -p \<project-name> up -d --build<br>
> - docker compose -f docker-compose.yml -f docker-compose.dev.yml -p \<project-name> down<br><br>

<br/>

---

<br/>

Image placeholder:  
https://via.placeholder.com/150.png
<br><br>
Image placeholder with customizable text background color:  
https://via.placeholder.com/150/000000/FFFFFF/?text=Dummy+Image.net <br><br>

<br/>

---

<br/>

> ## 7. Hasura CLI
>
> 1. npm install --save-dev hasura-cli ---- install hasura cli per-project  
>    `usage: npx hasura [commands] [flags]`
> 2. npm install --global hasura-cli ---- install hasura cli globaly  
>    `usage: hasura [commands] [flags]`
> 3. run: `hasura version`<br><br>

`hasura init [directory-name] [flags]`

Create a Hasura Project in the current working directory  
`hasura init .`

`hasura init [directory-name] --envfile` -> by default it looks for .env file  
`hasura init [directory-name] --envfile dev.env`  
`hasura init [directory-name] --envfile ../prod.env`

Create a directory with endpoint and admin secret configured:  
`hasura init [directory-name] --endpoint https://placeholder.com --admin-secret admin-dev`

Directory where commands are executed (default: current dir) and config version to be used (default 3)  
`hasura init [directory-name] --version 4  --project ../local/hasura --admin-secret admin-dev`

See https://hasura.io/docs/latest/hasura-cli/commands/hasura_init/

<br><br>

# Add Migrations and Metadata to version control

initialize version control  
`git init`

commit initial project status  
`git add .`  
`git commit -m "hasura project init"`

<br><br>

# Use the Console served by the CLI

**`hasura console [flags]`**  
 flags:

- `--address string                 address to serve console and migration API from (default "localhost")`
- `--admin-secret string            admin secret for Hasura GraphQL Engine (env "HASURA_GRAPHQL_ADMIN_SECRET")`
- `--api-host string                (PREVIEW: usage may change in future) host serving migrate api (default "http://localhost")`
- `--api-port string                port for serving migrate api (default "9693")`
- `--browser string                 open console in a specific browser`
- `--console-port string            port for serving console (default "9695")`
- `--endpoint string                http(s) endpoint for Hasura GraphQL Engine (env "HASURA_GRAPHQL_ENDPOINT")`
- `--envfile string      .env filename to load ENV vars from (default ".env")`

Recommended :

- `hasura console --envfile` -> most of the flags mentioned above, they've already reside in the .env file
- `hasura console --envfile ../utils/dev.env`
- `hasura console --envfile prod.env`

# Migrate database schema

**`hasura migrate [commands] [flags]`**  
commands: ['apply', 'create', 'init', 'delete', 'squash', 'status' ]

flags:

- `--admin-secret string            admin secret for Hasura GraphQL Engine (env "HASURA_GRAPHQL_ADMIN_SECRET")`
- `--database-name string           database on which operation should be applied`
- `--disable-interactive            disables interactive prompts (default: false) (env "HASURA_GRAPHQL_DISABLE_INTERACTIVE")`
- `--endpoint string                http(s) endpoint for Hasura GraphQL Engine (env "HASURA_GRAPHQL_ENDPOINT")`
- `--envfile string                 .env filename to load ENV vars from (default ".env")`

Recommended :

Create an initial Migration with the current database schema

- `hasura migrate create "init" --from-server`

creating empty migration with up & down file

- `hasura migrate create <name-of-migration> --database-name <database-name>`

Syncing the Migration with Metadata

- `hasura metadata apply`
- `hasura migrate apply --database-name <database-name>`
- `hasura metadata reload`
