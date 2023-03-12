#!/bin/bash

# Add GPG key
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Add repository
cat <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
metadata_expire=1h
EOF | sudo tee /etc/yum.repos.d/vscode.repo

sudo dnf install -y code
