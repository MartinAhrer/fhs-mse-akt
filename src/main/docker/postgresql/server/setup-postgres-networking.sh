#!/bin/sh
echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/$PG_MAJOR/$PG_CLUSTER_NAME/pg_hba.conf
echo "listen_addresses='*'" >> /etc/postgresql/$PG_MAJOR/$PG_CLUSTER_NAME/postgresql.conf
