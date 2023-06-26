# create cluster
eksctl create cluster --name k8s-235 --region us-east-1 --node-type t3.small --nodes 2
# get list clusters
aws eks list-clusters