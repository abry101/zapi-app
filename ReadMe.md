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

## **Hasura CLI**

### **Install Hasura CLI**

npm install --save-dev hasura-cli ---- install hasura cli per-project

- `usage: npx hasura [commands] [flags]`

npm install --global hasura-cli ---- install hasura cli globaly

- `usage: hasura [commands] [flags]`

run: `hasura version`<br><br>

### **Intializing Hasura CLI**

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

## **Add Migrations and Metadata to version control**

initialize version control  
`git init`

commit initial project status  
`git add .`  
`git commit -m "hasura project init"`

<br><br>

## **Use the Console served by the CLI**

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

# Examples :

- `hasura console --envfile` -> most of the flags mentioned above, they've already reside in the .env file
- `hasura console --envfile ../utils/dev.env`
- `hasura console --envfile prod.env`

## **Manage Migration**

**`hasura migrate [commands] [flags]`**  
commands: [apply, create, "init", delete, squash, status]

flags:

- `--admin-secret string            admin secret for Hasura GraphQL Engine (env "HASURA_GRAPHQL_ADMIN_SECRET")`
- `--database-name string           database on which operation should be applied`
- `--disable-interactive            disables interactive prompts (default: false) (env "HASURA_GRAPHQL_DISABLE_INTERACTIVE")`
- `--endpoint string                http(s) endpoint for Hasura GraphQL Engine (env "HASURA_GRAPHQL_ENDPOINT")`
- `--envfile string                 .env filename to load ENV vars from (default ".env")`

# Examples :

### **Create Migration**

Create an initial Migration with the current database schema

- `hasura migrate create "init" --from-server`

creating empty migration with up.sql & down.sql file

- `hasura migrate create <name-of-migration> --database-name <database-name>`

### **Apply Migrations**

for applying existing migrations to local(`e.g. https://localhost:8080`) instance

- `hasura migrate apply --database-name <database-name> --admin-secret <admin-secret>`

for applying existing migrations to remote(`e.g. https://xxx.hasura.app`) instance

- `hasura migrate apply --endpoint https://xxx.hasura.app --admin-secret <admin-secret>`

for applying a specific migration to local or remote instance

- `hasura migrate apply --database-name <database-name> --admin-secret <admin-secret> --version <version>`
- `hasura migrate apply --endpoint https://xxx.hasura.app --admin-secret <admin-secret> --version <version>`
- `hasura migrate apply --envfile example.env --version <version>`

marking a migration as applied on the server by skipping the execution

- `hasura migrate apply --database-name <database-name> --version <version> --skip-execution`

### **Rolling back applied Migrations**

- `hasura migrate apply --version 1550925483858 --type down --database-name <database-name>`

### **Squash Migrations**

- `hasura migrate squash --name "<new-name>" --from <start-migration-version> --database-name <database-name>`
- `hasura migrate apply --version "<squashed-migration-version>" --skip-execution --database-name <database-name>`

### **Migrations Status**

- `hasura migrate status`

### **Delete Migrations**

**NOTE:** Move all your Migrations to a backup folder, in case you need them later.  
_`mv migrations migrations_backup`_

for delete Migrations from the Server and clean up the local Migration files

- `hasura migrate delete --all --database-name <database-name>`
- `hasura migrate delete --database-name <database-name> --version <version>`

### For delete Migrations from the Server only

- `hasura migrate delete --all --server --database-name <database-name>`
- `hasura migrate delete --server --database-name <database-name> --version <version>`

## Manage Metadata

**`hasura metadata [commands] [flags]`**  
commands: [ apply, clear, diff, export, inconsistency, reload ]

flags:

- `--admin-secret string            admin secret for Hasura GraphQL Engine (env "HASURA_GRAPHQL_ADMIN_SECRET")`
- `--endpoint string                http(s) endpoint for Hasura GraphQL Engine (env "HASURA_GRAPHQL_ENDPOINT")`
- `--envfile string                 .env filename to load ENV vars from (default ".env")`

# Examples :

### **Export Hasura Metadata**

Export metadata and save it in migrations/metadata.yaml file:

- `hasura metadata export`
- `hasura metadata export --envfile example.env`
- `hasura metadata export --admin-secret "<admin-secret>"`

Write metadata to standard output in given format(json/yaml) for exported metadata _(note: this won't modify project metadata)_ Allowed values: json, yaml

- `hasura metadata export --admin-secret "<admin-secret>" -o json`
- `hasura metadata export --envfile example.env -o json`

Export metadata to another instance specified by the flag:

- `hasura metadata export --endpoint "<endpoint>"`
- `hasura metadata export --envfile other_instance.env`

### **Apply Hasura Metadata**

**NOTE:**  
Apply the database `Migration schema first, before apply the Metadata` Otherwise, it will result in an error saying the object does not exist.

Apply Hasura GraphQL Engine metadata present in metadata.[yaml|json] file:

- `hasura metadata apply`
- `hasura metadata apply --envfile example.env`
- `hasura metadata apply --admin-secret "<admin-secret>"`

Apply metadata to an instance specified by the flag:

- `hasura metadata apply --endpoint "<endpoint>"`
- `hasura metadata apply  --envfile other_instance.env`

Prevent inconsistent metadata from getting applied:

- `hasura metadata apply --disallow-inconsistent-metadata`
- `hasura metadata apply --envfile example.env --disallow-inconsistent-metadata`

Show metadata generated from project directory without applying to server. generated metadata will be printed as JSON by default, use -o flag for other display formats

- `hasura metadata apply --envfile example.env --dry-run -o json`

### **Reload Hasura Metadata**

- `hasura metadata reload`
- `hasura metadata reload --admin-secret "<admin-secret>"`
- `hasura metadata reload --endpoint "<endpoint>"`
- `hasura metadata reload --envfile example.env`

### **Clear Hasura Metadata**

- `hasura metadata clear`
- `hasura metadata clear --admin-secret "<admin-secret>"`
- `hasura metadata clear --endpoint "<endpoint>"`
- `hasura metadata clear --envfile example.env`

### **Metadata Inconsistencies**

**Alias**: inconsistencies, `ic`

- `hasura metadata ic status --envfile example.env`
- `hasura metadata ic list --envfile example.env`
- `hasura metadata ic drop --envfile example.env`

### **Diff Hasura Metadata**

**_`NOTE: This command is in preview, usage and diff format may change.`_**

Show changes between server metadata and the exported metadata file:

- `hasura metadata diff`
- `hasura metadata diff exp_md_1.json exp_md_2.json exp_md_3.json`

Apply admin secret for Hasura GraphQL Engine:

- `hasura metadata diff --admin-secret "<admin-secret>"`

Specify a diff type _`[allowed values: unified-json,unified-yaml, yaml, json]`_

- `hasura metadata diff --type "unified-json"`
- `hasura metadata diff --type "json"`

Diff metadata on a different Hasura instance:

- `hasura metadata diff --endpoint "<endpoint>"`

Using `diff` with _--envfile_

- `hasura metadata diff --envfile example.env`

## **Hasura Seed**

### **Create Seeds**:

Create a new seed file and use editor to add SQL:

- `hasura seed create new_table_seed`
- `hasura seed create new_table_seed --envfile example.env`
- `hasura seed create new_table_seed --database-name <database-name> --envfile example.env`

Create a new seed by exporting data from tables already present in the database:

- `hasura seed create users_seed --from-table users`
- `hasura seed create users_seed --from-table public.users`
- `hasura seed create users_seed --from-table users --database-name <database-name>`
- `hasura seed create users_seed --from-table users --envfile example.env`

Export data from multiple tables:

- `hasura seed create tables_seed --from-table table1 --from-table table2`
- `hasura seed create tables_seed --from-table table1 --from-table table2 --envfile example.env`

### **Apply Seeds**:

Apply all seeds on the database:

- `hasura seed apply`
- `hasura seed apply --all-databases`
- `hasura seed apply --database-name <database-name>`
- `hasura seed apply --database-name <database-name>  --envfile example.env`

Apply only a particular seed sql file:

- `hasura seed apply --file <seed-file> --database-name <database-name>`
- `hasura seed apply -f <seed-file> --database-name <database-name> --envfile example.env`

## **Hasura Deploy**

Apply metadata and migrations on Hasura GraphQL Engine

- `hasura deploy`

Apply metadata, migrations and seeds on Hasura GraphQL Engine

- `hasura deploy --with-seeds`

Use with admin secret and endpoint:

- `hasura deploy --admin-secret "<admin-secret> --endpoint "<endpoint>"`

Use with envfile:

- `hasura deploy --envfile example.env`
- `hasura deploy --with-seeds --envfile example.env`
