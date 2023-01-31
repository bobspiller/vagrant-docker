#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_DIR}
IDENTITY_FILE=insecure_vagrant_docker_id
PORT=${PORT:-2222}
VUSER=${VUSER:-vagrant}

set -x
ssh -i ${IDENTITY_FILE} \
  -p ${PORT} \
  -o "NoHostAuthenticationForLocalhost yes" \
  ${VUSER}@localhost
