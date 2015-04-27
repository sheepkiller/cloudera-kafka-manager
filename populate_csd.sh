#!/bin/sh
set -e

java -jar ../cm_ext/validator/target/validator.jar -s ./csd/KAFKA_MANAGER/src/descriptor/service.sdl
(cd csd/KAFKA_MANAGER && mvn clean package)
