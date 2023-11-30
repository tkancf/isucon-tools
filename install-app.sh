#!/bin/bash
# 必要なアプリケーションのインストール

# apt install
sudo apt update
sudo apt install -y \
percona-toolkit \
dstat \
git \
unzip \
wget

# kataribeのインストール
cd /tmp/
wget https://github.com/matsuu/kataribe/releases/download/v0.4.1/kataribe-v0.4.1_linux_amd64.zip -O kataribe.zip
unzip -o kataribe.zip
sudo mv kataribe /usr/local/bin/
sudo chmod +x /usr/local/bin/kataribe

# ghコマンドのインストール
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt install gh -y
