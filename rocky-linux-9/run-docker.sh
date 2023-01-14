#!/bin/bash

docker run -d \
  --privileged \
  --rm \
  --name rockyos-vagrant \
  -p 2222:22 \
  rockyos-vagrant:9.1