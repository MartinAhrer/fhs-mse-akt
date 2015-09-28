# image softwarecraftsmen/postgresql-server

FROM ubuntu:14.04.1
MAINTAINER Martin Ahrer <martin.ahrer@gmail.com>

ENV PG_MAJOR 9.3
ENV PG_CLUSTER_NAME main

# Add PostgreSQL's repository. It contains the most recent stable release
#     of PostgreSQL, ``9.3``.
#
#http://www.postgresql.org/download/linux/ubuntu/
#
# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 &&\
	echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# * Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
# * Disable creating a cluster during installation
# * Also, cleanup apt after installing
RUN apt-get -y update &&\
	apt-get install -y postgresql-common &&\
	sed -ri 's/#(create_main_cluster) .*$/\1 = false/' /etc/postgresql-common/createcluster.conf &&\
	apt-get -y install python-software-properties software-properties-common postgresql-$PG_MAJOR postgresql-client-$PG_MAJOR postgresql-contrib-$PG_MAJOR &&\
	rm -rf /var/lib/apt/lists/*
# Note: The official Debian and Ubuntu images automatically ``apt-get clean`` after each ``apt-get``

ADD setup-postgres-networking.sh /usr/local/fhs-hagenberg/
ADD setup-user.sql /usr/local/fhs-hagenberg/
ADD docker-entrypoint.sh /usr/local/fhs-hagenberg/
RUN chown postgres:postgres /usr/local/fhs-hagenberg/*.sh &&\
	chmod 700 /usr/local/fhs-hagenberg/*.sh

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
# add a volume /var/run/postgresql
#VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql", "/var/run/postgresql"]

ENV PATH /usr/lib/postgresql/$PG_MAJOR/bin:$PATH

# Set the default command to run when starting the container
ENTRYPOINT ["/usr/local/fhs-hagenberg/docker-entrypoint.sh"]
