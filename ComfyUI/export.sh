export AUTHOR_NAME=sobermh
export PROJECT_NAME=comfyui

docker-compose --profile base --profile export build
docker save -o ./${PROJECT_NAME}-export.tar ${PROJECT_NAME}:latest
