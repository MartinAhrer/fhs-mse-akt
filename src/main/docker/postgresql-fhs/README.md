# Building the fhs server container
```docker build --rm=true --tag=fhs-hagenberg/postgresql-server-fhs .```

# Running the fhs server container
First we create the data volume container since we need it later for linking its volumes to the server container.

```docker create --name postgresql-fhs-data fhs-hagenberg/postgresql-data```.

Next the server container is started with the volumes from the data volume container mounted:

```docker run -d --name="postgresql-fhs-server" --publish=5432:5432 --volumes-from=postgresql-fhs-data fhs-hagenberg/postgresql-server-fhs```

To run it interactively with a bash shell run ```docker exec -ti postgresql-fhs-server bash``` instead. 
At the shell prompt run ```su postgres --command "psql"``` for example to run the psql shell and check the database.

# Using docker-compose to run the fhs server container

docker-compose must be installed locally!

Startup the service using:
```docker-compose up -d```