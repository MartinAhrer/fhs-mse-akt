# TODO : use repository tag once finalized
FROM oracle-java8
MAINTAINER Martin Ahrer <martin.ahrer@gmail.com>

# TODO : Using a snapshot version on a continuos delivery environment is a major sin. However, this version number is given by the spring-data-rest-starbuckes example.
ENV APPLICATION_VERSION=1.0.0.BUILD-SNAPSHOT
ENV CI_BUILD_URL=https://snap-ci.com/buildartifacts/blue/40055/defaultPipeline/4/Commit/1
RUN wget ${CI_BUILD_URL}/rest/starbucks/target/spring-data-rest-starbucks-${APPLICATION_VERSION}.jar -O spring-data-rest-starbucks.jar

WORKDIR /

COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod 700 docker-entrypoint.sh

EXPOSE 8080

CMD ["./docker-entrypoint.sh"]
