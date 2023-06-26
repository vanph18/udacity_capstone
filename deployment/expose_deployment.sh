# expose deployment
kubectl expose deployment/hello --type="LoadBalancer" --port 80
# get information after expose deployment
kubectl get services -o wide