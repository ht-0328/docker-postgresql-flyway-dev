# Dockerの操作方法

## ビルド方法

### sh実行の権限を付与する

```sh
sudo chmod +x sh/docker-build.sh
```

### shを実行する
```sh
sudo ./sh/docker-build.sh
```

## 実行方法

### sh実行の権限を付与する

```sh
sudo chmod +x sh/docker-restart.sh
```

### shを実行する
```sh
sudo ./sh/docker-restart.sh
```

## コンテナが正常に作成したかを確認する

### PostgreSQLのバージョン確認
```sh
postgres --version
```

### flywayのバージョン確認
```sh
flyway -v
```