#!/bin/bash

export USR_HOME=$HOME
export PROJECT_ROOT=${PWD//$HOME\//}
export LOCAL_PYTHON_ROOT_ABS=$(poetry env info -p)
export LOCAL_PYTHON_ROOT=${LOCAL_PYTHON_ROOT_ABS//$HOME\//}

docker-compose --profile base --profile dev up






