# Dockerの操作方法

## ビルド方法

### 🔧sh実行の権限を付与する

```sh
sudo chmod +x sh/docker-build.sh
```

### ▶️ shを実行する
```sh
sudo ./sh/docker-build.sh
```

## 実行方法

### 🔧sh実行の権限を付与する

```sh
sudo chmod +x sh/docker-restart.sh
```

### ▶️shを実行する
```sh
sudo ./sh/docker-restart.sh
```

## コンテナが正常に作成したかを確認する

### 🐘PostgreSQLのバージョン確認
```sh
postgres --version
```

### 🐦flywayのバージョン確認
```sh
flyway -v
```

## 🐦flywayのコマンド

### ▶️マイグレーション処理の実行
```sh
flyway migrate
```

### ▶️現在のマイグレーションの状態を確認
```sh
flyway info
```
### ▶️データベースの全削除（開発用・注意）
```sh
flyway -cleanDisabled=false -schemas=public,master clean
```

### ▶️SQLファイルと実行履歴の整合性チェック
```sh
flyway validate
```

### ▶️失敗した履歴などを修復
```sh
flyway repair
```

## 🐘psqlコマンド
### ▶️スキーマ一覧を確認する方法
```sh
psql -U postgres -d appdb -c "\dn"
```

### ▶️特定のスキーマにあるテーブルの一覧を確認する方法
```sh
psql -U postgres -d appdb -c "\dt master.*"
```

## 動作確認コマンド

### 📄V1__create_schema.sqlが適用されたかを確認するコマンド
```sh
psql -U postgres -d appdb -c "SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'master';"
```

### 📄V2__create_master_tables.sql
```sh
psql -U postgres -d appdb -tAc "SELECT to_regclass('master.prefectures');"
```

### 📄V3__insert_master_prefectures.sql
```sh
psql -U postgres -d appdb -c "SELECT * FROM master.prefectures LIMIT 5;"
```