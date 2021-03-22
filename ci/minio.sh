#! /bin/bash -eu

curl -L -f -o /usr/local/bin/minio https://dl.minio.io/server/minio/release/linux-amd64/minio
chmod +x /usr/local/bin/minio

cat >/etc/systemd/system/minio.service <<-EOF
[Unit]
Description=Minio S3 Service
After=postgres.service
[Service]
EnvironmentFile=-/etc/default/minio
ExecStartPre=/bin/bash -c "[ -n \"${MINIO_VOLUMES}\" ] || echo \"Variable MINIO_VOLUMES not set in /etc/default/minino\""
ExecStart=/usr/local/bin/minio server $MINIO_OPTS $MINIO_VOLUMES
Type=simple
[Install]
WantedBy=default.target
EOF

systemctl enable minio.service
systemctl start minio.service
