#!/bin/bash

set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

# gitの直近のログをDiscordに送信
GIT_LOG=$(git log --pretty='%C(green)%cd %C(reset)%s %C(red)%d %C(cyan)[%an]' --date=iso | head -n1)
curl -s -H "Content-Type: application/json" -X POST -d "{\"content\": \"$GIT_LOG\"}" $DISCORD_HOOK > /dev/null

$SCRIPT_PATH/nginx-analyze.sh
$SCRIPT_PATH/mysql-analyze.sh
