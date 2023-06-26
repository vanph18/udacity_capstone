# Build image and add a descriptive tag
docker build --tag=hello .
docker image list
# Run flask app
docker run -p 80:80 hello 