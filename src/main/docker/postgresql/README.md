# README

The server container offers an extension point for executing SQL scripts during database cluster creation. This can be used for example to create a database schema.
For utilizing this extension one or more valid SQL file may be put into ```/etc/fhs-hagenberg/postgresql/docker-entrypoint-initdb.d/```. Note that no execution order is guaranteed for multiple SQL files.

# Building the server container image

```docker build --rm=true --tag=fhs-hagenberg/postgresql-server .```

# Building the data container image

```docker build --rm=true --tag=fhs-hagenberg/postgresql-data .```
