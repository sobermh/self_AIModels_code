#!/bin/bash


export PROJECT_NAME=skyreels-v1

docker-compose --profile base --profile dev build && docker-compose --profile base --profile dev up
