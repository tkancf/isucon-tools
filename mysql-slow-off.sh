#!/bin/bash
# MySQLのslow query logをOFFにするスクリプト
set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

$MYSQL_CMD -e 'set global slow_query_log = OFF;'
echo "MySQLのslow logをOFFにしました"
