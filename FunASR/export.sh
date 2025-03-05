export PROJECT_NAME=funasrs

docker-compose --profile base --profile export build
docker save -o ./${PROJECT_NAME}-export.tar ${PROJECT_NAME}:latest
