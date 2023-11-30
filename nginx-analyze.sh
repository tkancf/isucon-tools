#!/bin/bash
# nginxのログをkataribeで解析してDiscordに送信する

# 設定ファイルの読み込み
set -euC
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

sudo rm -f $NGINX_ANALYZE_RESULT
echo "kataribe start"
sudo cat $NGINX_LOG | kataribe -f $KATARIBE_CONF > $NGINX_ANALYZE_RESULT
echo "nginxのanalyze結果を送信しました"
curl -s -X POST -H "Content-Type: multipart/form-data" -F "file=@$NGINX_ANALYZE_RESULT" "$DISCORD_HOOK" > /dev/null
