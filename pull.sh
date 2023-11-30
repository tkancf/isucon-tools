#!/bin/bash
# GitHubから最新のコードを取得するスクリプト
set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

# 最新のGitHubのコードをpullしてrebase
cd $GIT_DIR
git pull --rebase
