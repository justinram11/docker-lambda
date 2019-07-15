#!/bin/sh

docker build --no-cache --squash -t justinram11/lambda-base-2:build -f ./build-2/Dockerfile .
