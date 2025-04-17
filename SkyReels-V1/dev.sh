#!/bin/bash


export DOCKER_NAME=skyreels-v1
export DOCKER_BASE_IMAGE=${DOCKER_NAME}-base:latest
export PROJECT_NAME=SkyReels-V1
export PROJECT_PATH=./${PROJECT_NAME}

docker compose --profile base --profile dev build && docker compose --profile base --profile dev up

