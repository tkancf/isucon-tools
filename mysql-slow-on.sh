#!/bin/bash
# ベンチマークを実行してベンチマークの結果をDiscordに送信するスクリプト
set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

$MYSQL_CMD -e 'set global long_query_time = 0; set global slow_query_log = ON;'
echo "MySQLのslow logを有効化しました"
