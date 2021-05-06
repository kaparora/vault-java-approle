#!/bin/sh
set -o xtrace
#mvn package
docker build --build-arg JAR_FILE=target/spring-vault-demo-1.0.jar -t spring .