#!/bin/sh
# Configuration for the key using between the worker and the web
mkdir -p keys/web keys/worker
mkdir -p /keys/web /keys/worker

ssh-keygen -t rsa -f keys/web/tsa_host_key -N '' && \
ssh-keygen -t rsa -f keys/web/session_signing_key -N '' && \
ssh-keygen -t rsa -f keys/worker/worker_key -N '' && \
cp keys/worker/worker_key.pub keys/web/authorized_worker_keys && \
cp keys/web/tsa_host_key.pub keys/worker

# Proxy configuration
# Cntlm must be in mode gateway : Gateway yes
sudo mkdir -p /etc/systemd/system/docker.service.d

cat >/etc/systemd/system/docker.service.d/https-proxy.conf <<-EOF
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:3128/" "NO_PROXY=localhost"
EOF

cat >/etc/systemd/system/docker.service.d/http-proxy.conf <<-EOF
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:3128/" "NO_PROXY=localhost"
EOF

# Reload service configuration and show config
sudo systemctl daemon-reload
sudo systemctl show --property=Environment docker

# To start a docker local registry
sudo docker run -d -p 5000:5000 --restart=always --name registry registry:2

# To delete docker local registry
# sudo docker stop registry && sudo docker rm -v registry
