#!/bin/sh

PG_USER=postgres
if [ -z "`pg_lsclusters -h`" ]; then
  pg_createcluster $PG_MAJOR $PG_CLUSTER_NAME -e UTF8

  # Adjust PostgreSQL configuration so that remote connections to the database are possible.
  /usr/local/fhs-hagenberg/setup-postgres-networking.sh

  /etc/init.d/postgresql start

  # Set a password so we can authenticate remotely
  su $PG_USER --command="psql --file=/usr/local/fhs-hagenberg/setup-user.sql"

  # This entrypoint supports callbacks that may be contributed by images built from this one.
  # No callback SQL must assume that it is created in a specific order
  if [ -d /etc/fhs-hagenberg/postgresql/docker-entrypoint-initdb.d ]; then
    for f in /etc/fhs-hagenberg/postgresql/docker-entrypoint-initdb.d/*.sql; do 
      if [ -f "$f" ]; then 
        su $PG_USER --command="psql --file=$f"; 
      fi; 
    done
  fi
  /etc/init.d/postgresql stop
fi

exec su $PG_USER --command="/usr/lib/postgresql/$PG_MAJOR/bin/postgres -D /var/lib/postgresql/$PG_MAJOR/$PG_CLUSTER_NAME -c config_file=/etc/postgresql/$PG_MAJOR/$PG_CLUSTER_NAME/postgresql.conf"
