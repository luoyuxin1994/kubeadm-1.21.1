#!/bin/bash
kubectl apply -f recommended.yaml
echo "please wait create"
sleep 20
kubectl get all -n kubernetes-dashboard
kubectl describe secrets -n kubernetes-dashboard | grep -A 12 dashboard-admin-token
echo -e "[ \033[32m Please copy the token Login to any node IP
https://node_ip:30001 \033[0m ]"
