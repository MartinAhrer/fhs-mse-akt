#!/bin/sh

# TODO : improve script such that we can pass additional arguments

# using bash exec so process signals are sent to the Java process rather than bash
exec java -jar -Dspring.data.mongodb.host=$MONGO_PORT_27017_TCP_ADDR -Dspring.data.mongodb.port=$MONGO_PORT_27017_TCP_PORT spring-data-rest-starbucks.jar
