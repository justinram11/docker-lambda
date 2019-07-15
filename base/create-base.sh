#!/bin/bash

curl -O https://lambci.s3.amazonaws.com/fs/base.tgz

docker build --squash -t justinram11/lambda-base .

rm ./base.tgz
