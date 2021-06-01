# kubeadm-1.21.1
1、当前为一master多node节点自动化在线部署（在centos7.9上适配成功 docker-ce20.10.6 kubeadm-1.21.1），如需在其他系统版本或者docker、kubeadm版本部署,请事先做适配！
2、在执行脚本前有如下需要修改部分：
init_system.sh里面主机IP与对应主机名
install_pkg.sh不做修改（如需安装其他指定版本请做修改）
pull_images.sh不做修改（如需测试安装其他版本，请先执行kubeadm config images list命令，然后修改image里变量和coredns版本）
init_kubeadm.sh修改kubeadm init参数 --apiserver-advertise-address=192.168.159.100  <---IP修改为master的IP即可
3、将kubeadm-1.21.1上传到任意目录，进入目录执行 sh select.sh
master节点输入1
node节点输入2
3为master的dashboard（可选非必须）
![image](https://user-images.githubusercontent.com/57087563/120353747-72ff9400-c334-11eb-90d8-bac73b1c96b2.png)
