#!/bin/bash
#init  ip地址修改为当前初始化master IP
kubeadm init --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers --kubernetes-version v1.21.1 --pod-network-cidr=10.244.0.0/16 --service-cidr=10.1.0.0/16 --apiserver-advertise-address=192.168.159.100
#set ENV
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
#install flannel network
kubectl apply -f kube-flannel.yml
sleep 60
#Resolve component health status
sed -i 's/- --port=0/#- --port=0/' /etc/kubernetes/manifests/kube-controller-manager.yaml
sed -i 's/- --port=0/#- --port=0/' /etc/kubernetes/manifests/kube-scheduler.yaml
sleep 20
#check status
kubectl get pod --all-namespaces
kubectl get cs
kubeadm token create --print-join-command
echo -e "[ \033[32m Please copy the above command to node to join the cluster \033[0m ]"
