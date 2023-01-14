#!/bin/bash

docker run -d \
  --privileged \
  --rm \
  --name centos-vagrant \
  -p 2222:22 \
  centos-vagrant:7