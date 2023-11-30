#!/bin/bash
# MySQLのログをpt-query-digestで解析してDiscordに送信する

set -euC

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $SCRIPT_PATH/config

sudo rm -f "$MYSQL_ANALYZE_RESULT"
echo "pt-query-digest start"
sudo pt-query-digest "$MYSQL_LOG" > "$MYSQL_ANALYZE_RESULT"
curl -s -X POST -H "Content-Type: multipart/form-data" -F "file=@$MYSQL_ANALYZE_RESULT" "$DISCORD_HOOK" > /dev/null
echo "MySQLのanalyze結果を送信しました"
