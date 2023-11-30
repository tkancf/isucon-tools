#!/bin/bash
# アプリケーションを再起動するスクリプト
set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

sudo cp -a $HOME/nginx/isuports.conf /etc/nginx/sites-available/isuports.conf
sudo cp -a $HOME/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp -a $HOME/mysqld/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
