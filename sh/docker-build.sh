#!/bin/bash
set -e  # エラーがあれば停止

# イメージ名を変数化
IMAGE_NAME="db"

# プロジェクトのルートディレクトリを取得
PROJECT_ROOT="$(dirname "$0")/.."

echo "=== Docker イメージをビルド中: $IMAGE_NAME ==="

docker build -t $IMAGE_NAME -f "$PROJECT_ROOT/docker/Dockerfile" "$PROJECT_ROOT"

if [ $? -eq 0 ]; then
    echo "✅ Docker イメージのビルド完了: $IMAGE_NAME"
else
    echo "❌ ビルドに失敗しました。"
    exit 1
fi
