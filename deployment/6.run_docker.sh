# Build image and add a descriptive tag
sudo docker build --tag=hello .
sudo docker image list
# Run flask app
sudo docker run -p 80:80 hello 