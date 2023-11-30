#!/bin/bash
# Discordにファイルを送信するスクリプト
set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

# $1にファイルパスが指定されていることを確認する
if [ $# -ne 1 ]; then
  echo "Usage: $0 <file path>"
  exit 1
fi

# ファイルを送信する
curl -H "Content-Type: multipart/form-data" -X POST -F "file=@$1" $DISCORD_HOOK
