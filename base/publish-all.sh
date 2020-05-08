#!/bin/bash

RUNTIMES="provided go1.x nodejs4.3 nodejs6.10 nodejs8.10 nodejs10.x nodejs12.x python2.7 python3.6 python3.7 python3.8 ruby2.5 ruby2.7 java8 java11 dotnetcore2.0 dotnetcore2.1 dotnetcore3.1"

echo -n "Enter repository passphrase: "
read -s DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE
echo

export DOCKER_CONTENT_TRUST=1
export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE

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
