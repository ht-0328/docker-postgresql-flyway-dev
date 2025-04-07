#!/bin/bash
set -e  # エラーがあれば停止

# スクリプトのあるディレクトリ
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
ENV_FILE="$PROJECT_ROOT/.devcontainer/.env"

# .envを読み込む
if [ -f "$ENV_FILE" ]; then
  echo "📄 .env を読み込み中: $ENV_FILE"
  set -a
  source "$ENV_FILE"
  set +a
else
  echo "⚠️ .env が見つかりません: $ENV_FILE"
  exit 1
fi

# イメージ名（build時と統一）
IMAGE_NAME="db"

# コンテナ名（停止時に特定しやすくするため）
CONTAINER_NAME="db-dev"

echo "=== Docker コンテナを再起動します: $CONTAINER_NAME ==="

# もしコンテナが動いていたら停止（エラーが出ても無視）
docker stop $CONTAINER_NAME 2>/dev/null || true

# もしコンテナが残っていたら削除（エラーが出ても無視）
docker rm $CONTAINER_NAME 2>/dev/null || true

# 再度コンテナを起動
docker run -it --rm \
    --name $CONTAINER_NAME \
    -v "$PROJECT_ROOT:/workspace" \
    -w /workspace \
    -e POSTGRES_USER=$POSTGRES_USER \
    -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
    -e POSTGRES_DB=$POSTGRES_DB \
    -p 5432:5432 \
    $IMAGE_NAME bash

echo "✅ コンテナの再起動が完了しました"
