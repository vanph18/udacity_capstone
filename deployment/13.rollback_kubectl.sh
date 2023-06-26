# check version app that we have
kubectl rollout history deploy hello
# rollback
kubectl rollout undo deployment hello --to-revision=1