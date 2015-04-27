# Kafka manager on Cloudera Manager (tested only with CDH 5.4.0)
## Quick start
1. grab csd from [http://parcels.cotds.org/kafka-manager/csd/KAFKA_MANAGER-1.2.0.jar](http://parcels.cotds.org/kafka-manager/csd/KAFKA_MANAGER-1.2.0.jar) and put it into ```/opt/cloudera/csd``` on your Cloudera Manager Host
2. Before adding the service, please fetch parcels
3. Add a new service _Kafka Manager_ and modify application secret.
4. Go to Kafka Manager UI and add a cluster.

## Hacking da stuff
### parcel
We use docker to build kakfa-manager. We use Oracle JDK 7 for this build. Modify the Dockerfile to depend on Oracle JDK 8
1. Build the docker image and extract target
```
docker build -t build/km-parcels .
docker run -it --rm -v ${PWD}/parcels/KAFKA_MANAGER-1.2.0:/out clement/km-build cp -Rvfp /kafka-manager-1.2.0 /out/kafka-manager
```
2. launch ```populate parcels.sh```
### CSD
1. go to ```csd```
2. hack
3. ```mvn package```

