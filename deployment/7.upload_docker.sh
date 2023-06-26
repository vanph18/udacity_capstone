dockerpath="vanph/hello:v2.0.0"
sudo docker login
sudo docker tag hello ${dockerpath}
echo "Docker ID and Image: $dockerpath"
# Push image to a docker repository
sudo docker push ${dockerpath}
