echo "Script for building Docker image and pushing it into Docker Hub"

@REM Set global variables here
set CONTAINER_NAME=duplicated_photos_remove_poc
set REPOSITORY=abdarum/duplicated_photos_remove_poc

@REM Process could be exited before a start
set /p "TAG_VERSION=Enter TAG version number: "

@REM Build an image
docker build -t %CONTAINER_NAME% .
docker commit %CONTAINER_NAME%

docker images -a
set /p "IMAGE_ID=Enter IMAGE ID: "

docker tag %IMAGE_ID% %REPOSITORY%
docker tag %IMAGE_ID% %REPOSITORY%:%TAG_VERSION%

docker image push %REPOSITORY%
docker image push %REPOSITORY%:%TAG_VERSION%