#!/bin/bash
# アプリケーションをビルドするスクリプト
set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

# アプリケーションをビルド
cd $APP_DIR
make
cd $APP_DIR
