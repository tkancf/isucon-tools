#!/bin/bash
# ベンチマークを実行してベンチマークの結果をDiscordに送信するスクリプト
set -euC

# 設定ファイルを読み込む
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

# ベンチマークを実行
rm -f /tmp/bench-score.log
rm -f /tmp/bench-score.txt
cd $HOME/bench
./bench -target-addr 127.0.0.1:443 > /tmp/bench-score.log
cd -

tail -n 3 /tmp/bench-score.log > /tmp/bench-score.txt
curl -s -H "Content-Type: multipart/form-data" -X POST -F "file=@/tmp/bench-score.txt" $DISCORD_HOOK
