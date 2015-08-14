#!/bin/sh
set -e

java -jar ../cm_ext/validator/target/validator.jar -s ./csd/KAFKA_MANAGER/src/descriptor/service.sdl
(cd csd/KAFKA_MANAGER && mvn clean package)
#scp csd/KAFKA_MANAGER/target/KAFKA_MANAGER-1.2.0.jar root@cloudera00.int.cotds.org:/opt/cloudera/csd
#ssh root@cloudera00.int.cotds.org service cloudera-scm-server restart
#rsync -avl csd/KAFKA_MANAGER/target/KAFKA_MANAGER-1.2.0.jar root@dingo.cotds.org:/srv/parcels/csd-dev/csd
