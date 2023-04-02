#!/bin/bash

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 455462641947.dkr.ecr.us-east-1.amazonaws.com
docker rm -f $(docker ps -qa) || true
docker run -itd -p 3000:3000 455462641947.dkr.ecr.us-east-1.amazonaws.com/kxc-desafio-tecnico:DEV
