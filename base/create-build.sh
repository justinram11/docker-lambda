#!/bin/sh

docker build --no-cache -t justinram11/lambda-base:build -f ./build/Dockerfile .
