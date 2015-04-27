#!/bin/bash
set -e

VERSION=1.2.0
rm -fr parcels
mkdir -p parcels/KAFKA_MANAGER-${VERSION}

java -jar ../cm_ext/validator/target/validator.jar -d src/parcels/KAFKA_MANAGER-${VERSION}/
java -jar ../cm_ext/validator/target/validator.jar -a src/parcels/KAFKA_MANAGER-${VERSION}/meta/alternatives.json
java -jar ../cm_ext/validator/target/validator.jar -p src/parcels/KAFKA_MANAGER-${VERSION}/meta/parcel.json
java -jar ../cm_ext/validator/target/validator.jar -r src/parcels/KAFKA_MANAGER-${VERSION}/meta/permissions.json

for os in el5 el6 sles11 lucid precise squeeze wheezy
do
    (cd src/parcels && tar zcf ../../parcels/KAFKA_MANAGER-${VERSION}/KAFKA_MANAGER-${VERSION}-$os.parcel KAFKA_MANAGER-${VERSION} --owner=root --group=root)
#    tar tvf parcels/KAFKA_MANAGER-${VERSION}/KAFKA_MANAGER-${VERSION}-$os.parcel
    java -jar ../cm_ext/validator/target/validator.jar -f  parcels/KAFKA_MANAGER-${VERSION}/KAFKA_MANAGER-${VERSION}-$os.parcel
done

python ../cm_ext/make_manifest/make_manifest.py  parcels/KAFKA_MANAGER-${VERSION}
java -jar ../cm_ext/validator/target/validator.jar -m parcels/KAFKA_MANAGER-${VERSION}/manifest.json

(cd parcels && ln -sf KAFKA_MANAGER-${VERSION} latest )

