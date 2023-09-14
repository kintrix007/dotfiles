#!/usr/bin/env bash

# Add GPG key
rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Add repository
cat <<EOF > /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
metadata_expire=1h
EOF

sudo dnf install -y code
