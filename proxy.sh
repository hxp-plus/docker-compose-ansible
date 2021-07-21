#!/bin/bash

if [ -z $1 ];then
	echo "Usage: ./proxy.sh proxy_address:port"
	exit
fi
mkdir -p /etc/systemd/system/docker.service.d
touch /etc/systemd/system/docker.service.d/http-proxy.conf
cat > /etc/systemd/system/docker.service.d/http-proxy.conf << EOF
[Service]
Environment="HTTP_PROXY=$1"
EOF
systemctl daemon-reload
systemctl restart docker
systemctl show --property Environment docker
