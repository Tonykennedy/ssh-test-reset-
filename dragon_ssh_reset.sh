#!/bin/bash

SOURCE_USER="tony"
SOURCE_IP="192.168.1.10"
TARGET_USER="dragonmaster"
TARGET_IP="192.168.1.20"
EMAIL="tony@dragonsketch.com"

echo "🔄 Resetting SSH on source..."
rm -f ~/.ssh/id_rsa ~/.ssh/id_rsa.pub ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
rm -f ~/.ssh/known_hosts ~/.ssh/config

echo "🔄 Resetting SSH on target..."
ssh ${TARGET_USER}@${TARGET_IP} <<EOF
  rm -f ~/.ssh/authorized_keys
  rm -f ~/.ssh/id_rsa ~/.ssh/id_rsa.pub ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
  rm -f ~/.ssh/known_hosts ~/.ssh/config
  echo "🐉 Welcome to the Dragon's Lair 🐉" | sudo tee /etc/issue.net > /dev/null
  echo "Banner /etc/issue.net" | sudo tee -a /etc/ssh/sshd_config > /dev/null
  sudo systemctl restart sshd
EOF

echo "🔐 Generating new SSH key..."
ssh-keygen -t rsa -b 4096 -C "${EMAIL}" -f ~/.ssh/id_rsa -N ""

echo "📤 Copying public key to target..."
ssh-copy-id ${TARGET_USER}@${TARGET_IP}

echo "✅ Testing SSH connection..."
ssh ${TARGET_USER}@${TARGET_IP} "echo '🔥 SSH connection successful. Welcome, Dragonmaster!'"
