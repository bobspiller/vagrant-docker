#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_DIR}
IDENTITY_FILE=~/.vagrant.d/insecure_private_key
PORT=${PORT:-2222}
VUSER=${VUSER:-vagrant}

set -x
ssh -i ${IDENTITY_FILE} \
  -p ${PORT} \
  -o "NoHostAuthenticationForLocalhost yes" \
  ${VUSER}@localhost
