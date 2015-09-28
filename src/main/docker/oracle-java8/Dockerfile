#
# Oracle Java 8 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java8
#

# Pull base image.
FROM ubuntu:14.04.3
MAINTAINER Martin Ahrer <martin.ahrer@gmail.com>

# Install Java.

RUN \
  apt-get update && \
  apt-get -y install python-software-properties software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  apt-get install oracle-java8-set-default && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
RUN JAVA_HOME=`(readlink -f /usr/bin/java | sed "s:jre/bin/java::")` && \
  echo "JAVA_HOME=$JAVA_HOME" >> /etc/environment
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]

# Using the oracle installer does not allow us to explicitely set the update level and thus does not give us a stable version number (this is a bit of a problem in a continuous delivery environment as we can't expect a predictable environment)
