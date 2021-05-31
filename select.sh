#!/bin/bash 
#Print menu
cat <<EOF
        Option:
        1) install master.
        2) install node.
        3) Add dashboard to master.
        *) exit.
EOF
read -p "Please enter a option:" number

# Select execute script
case $number in
1)
        sh init_system.sh
	sh install_pkg.sh
	sh pull_images.sh
	sh init_kubeadm.sh ;;
2)
        sh init_system.sh
	sh install_pkg.sh ;;
3)
        sh dashboard.sh ;;
*)
        echo "exit."  ;;
esac
