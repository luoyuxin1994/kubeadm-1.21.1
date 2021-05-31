#!/bin/bash
#Please check the image version first
kubeadm config images list
#get images
images=(
    kube-apiserver:v1.21.1
    kube-proxy:v1.21.1
    kube-controller-manager:v1.21.1
    kube-scheduler:v1.21.1
    etcd:3.4.13-0
    pause:3.4.1
)

for imageName in ${images[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done
#get coredns
docker pull coredns/coredns:1.8.0

docker tag coredns/coredns:1.8.0 registry.cn-hangzhou.aliyuncs.com/google_containers/coredns/coredns:v1.8.0

docker rmi coredns/coredns:1.8.0
