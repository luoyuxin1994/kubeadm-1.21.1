#!/bin/bash
#关闭防火墙
systemctl stop firewalld
systemctl disable firewalld

#关闭selinux：
sed -i 's/enforcing/disabled/' /etc/selinux/config 
setenforce 0

#关闭swap：
swapoff -a   #临时关闭
sed -i 's/\/dev\/mapper\/centos-swap/\#\/dev\/mapper\/centos-swap/' /etc/fstab   #永久关闭，注释swap配置哪一行

#添加主机名与IP对应关系（记得先设置主机名）：
cat >> /etc/hosts <<EOF
192.168.159.100 kubeadm-master
192.168.159.101 kubeadm-node1
192.168.159.102 kubeadm-node2
EOF

#将桥接的IPv4流量传递到iptables的链
cat > /etc/sysctl.d/k8s.conf << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
