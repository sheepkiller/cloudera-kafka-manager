# Kafka manager on Cloudera Manager (tested only with CDH 5.4.0) /!\ required Java 8 /!\
## Quick start
1. grab csd from [http://parcels.cotds.org/kafka-manager/csd/KAFKA_MANAGER-1.2.0-2.jar](http://parcels.cotds.org/kafka-manager/csd/KAFKA_MANAGER-1.2.0-2.jar) and put it into ```/opt/cloudera/csd``` on your Cloudera Manager Host
2. Before adding the service, please fetch parcels
3. Add a new service _Kafka Manager_, modify application secret, an optionally set a the name of you Kafka cluster.
4. Go to ```Kafka Manager Web UI``` (via Kafka Manager service) to configure you Kakfa.

