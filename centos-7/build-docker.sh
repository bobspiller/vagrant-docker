#!/bin/bash
set -x
TAG=${TAG:-centos-vagrant:7}
docker build -t ${TAG} .