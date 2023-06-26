# rolling-update
kubectl set image deployment hello hello=vanph/hello:v2.0.0
# get status after rolling-update
kubectl rollout status deploy hello