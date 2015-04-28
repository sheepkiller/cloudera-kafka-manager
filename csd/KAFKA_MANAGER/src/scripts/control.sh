#!/bin/bash
##
# Licensed to Cloudera, Inc. under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  Cloudera, Inc. licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

# Time marker for both stderr and stdout
date 1>&2

CMD=$1
shift

DEFAULT_KAFKA_MANAGER_HOME=/usr/lib/kafka-manager

export KAFKA_MANAGER_HOME=${KAFKA_MANAGER_HOME:-$DEFAULT_KAFKA_MANAGER_HOME}


case $CMD in

  (start)
    exec ${KAFKA_MANAGER_HOME}/bin/kafka-manager -mem $((${KAFKA_MANAGER_MEMORY} / (1024*1024))) -Dpidfile.path=${CONF_DIR}/RUNNING_PID -Dkafka-manager.zkhosts=${ZK_QUORUM} -Dconfig.file=${CONF_DIR}/kafka-manager.properties ${@}  
    ;;
  (config)
    exec curl  ${KM_URL} --data "name=${KM_CLUSTER_NAME}&zkHosts=${ZK_QUORUM}&kafkaVersion=${KAFKA_VERSION}" -X POST
    ;;
  (*)
    log "Don't understand [$CMD]"
    ;;

esac
