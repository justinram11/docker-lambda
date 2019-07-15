#!/bin/bash

RUNTIMES="provided nodejs4.3 nodejs6.10 nodejs8.10 nodejs10.x python2.7 python3.6 python3.7 ruby2.5 java8 go1.x dotnetcore2.0 dotnetcore2.1"

docker push justinram11/lambda-base
docker push justinram11/lambda-base-2

for RUNTIME in $RUNTIMES; do
  echo $RUNTIME
  docker push justinram11/lambda:${RUNTIME}
done

docker push justinram11/lambda-base:build
docker push justinram11/lambda-base-2:build

for RUNTIME in $RUNTIMES; do
  echo build-${RUNTIME}
  docker push justinram11/lambda:build-${RUNTIME}
done
