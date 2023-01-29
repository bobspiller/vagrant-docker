#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
cd ${SCRIPT_DIR}
IDENTITY_FILE=$(vagrant ssh-config | grep IdentityFile | awk '{print $2}')
PORT=${PORT:-2200}
VUSER=${VUSER:-vagrant}

set -x
ssh -i ${IDENTITY_FILE} \
  -p ${PORT} \
  -o "NoHostAuthenticationForLocalhost yes" \
  ${VUSER}@localhost
