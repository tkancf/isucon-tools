# ISUCON便利スクリプト

## 使い方

各ユースケースごとの実行例です。

### ベンチマーク実行前の準備

```sh
pull.sh && cp-conf.sh && app-build.sh && prepare.sh
```

- pull.sh
  - リポジトリの最新を取得する
- cp-conf.sh
  - 設定ファイルをコピーして配置する
- app-build.sh
  - アプリケーションをビルドする
- prepare.sh
  - ログ初期化、再起動、slow logをON

### ベンチマーク実行後の解析

```sh
analyze.sh
```

- analyze.sh
  - nginx, mysqlのログを解析して結果を表示する

### MySQLへ接続したい

```sh
mysql-connect.sh
```

### MySQLのスロークエリログをONにしたい

```sh
mysql-slow-on.sh
```

### MySQLのスロークエリログをOFFにしたい

```sh
mysql-slow-off.sh
```

### ファイルをディスコードに送りたい

```sh
discordFileTransfer.sh <ファイル名>
```

### リポジトリの内容は反映させずにベンチマークだけ実行したい場合 (たまにやる)

- prepare.sh
  - ログ初期化、再起動、slow logをON

```sh
prepare.sh
```
