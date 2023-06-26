# deployement kubernet
kubectl create deployment hello --image=vanph/hello:v1.0.0 --replicas=3
# get status after deployment
kubectl get deployment