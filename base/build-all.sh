#!/bin/bash

RUNTIMES="provided nodejs4.3 nodejs6.10 nodejs8.10 nodejs10.x python2.7 python3.6 python3.7 ruby2.5 java8 go1.x dotnetcore2.0 dotnetcore2.1"

TOP_DIR="${PWD}/.."

for RUNTIME in $RUNTIMES; do
  echo $RUNTIME

  cd ${TOP_DIR}/${RUNTIME}/run

  [ -x ./update_libs.sh ] && ./update_libs.sh

  docker build -t justinram11/lambda:${RUNTIME} .
done
docker tag justinram11/lambda:nodejs4.3 justinram11/lambda:latest

for RUNTIME in $RUNTIMES; do
  echo build-${RUNTIME}

  cd ${TOP_DIR}/${RUNTIME}/build

  docker build -t justinram11/lambda:build-${RUNTIME} .
done
docker tag justinram11/lambda:build-nodejs4.3 justinram11/lambda:build
