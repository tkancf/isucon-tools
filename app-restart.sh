#!/bin/bash
# アプリケーションを再起動するスクリプト
set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

sudo systemctl restart "$APP_SYS_NAME"
