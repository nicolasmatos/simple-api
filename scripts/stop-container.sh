#!/bin/bash

docker rm -f $(docker ps -qa) || true
docker rmi 455462641947.dkr.ecr.us-east-1.amazonaws.com/kxc-desafio-tecnico:DEV || true
