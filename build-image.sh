#!/bin/bash
build_date=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
git_ref=$(cd ./app/cerebrate && git rev-parse --short HEAD)

echo Building new cerebrate image
echo Version   : $git_ref
echo Build_date: $build_date

docker build --build-arg BUILD_DATE=$build_date \
    --build-arg VCS_REF=$git_ref \
    --build-arg BUILD_VERSION=$git_ref \
    -f ./.docker/cerebrate/Dockerfile \
    -t cerebrate:latest .

docker build -f ./.docker/nginx/Dockerfile -t cerebrate-nginx:latest .
