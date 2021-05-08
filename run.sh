#!/bin/bash
set -eu

cat > /etc/systemd/system/jupyter.service <<EOF
[Unit]
Description=Jupyter
After=network.target
 
[Service]
Type=simple
ExecStart=/usr/local/bin/jupyter notebook --allow-root --ip 0.0.0.0 --no-browser
 
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start jupyter
sudo systemctl enable jupyter

