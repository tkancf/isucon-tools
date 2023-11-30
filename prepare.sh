#!/bin/bash
# ベンチマークを回す前に実行するスクリプト
set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

sudo rm -f $MYSQL_LOG
sudo rm -f $NGINX_LOG

sudo systemctl restart "$APP_SYS_NAME"
sudo systemctl restart $NGINX_SYS_NAME
sudo systemctl restart $MYSQL_SYS_NAME

# MySQLのslow logを有効化
eval $SCRIPT_PATH/mysql-slow-on.sh
