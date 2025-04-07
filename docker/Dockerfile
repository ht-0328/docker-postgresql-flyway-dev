# Dockerhub: https://hub.docker.com/_/postgres
# ベースイメージ: Debian BookwormベースのPostgreSQL公式イメージ
FROM postgres:17-bookworm

# パッケージのインストール時に対話的なプロンプトが表示されないように設定する
ENV DEBIAN_FRONTEND=noninteractive

# 必要なツールをaptでインストール
RUN set -eux && \
    apt-get update && \
    apt-get install -y \
    # URLからデータを取得するためのツール
    curl \
    # 圧縮アーカイブを解凍するためのツール
    tar \
    # バージョン管理システム
    git \
    # プロセス確認
    procps  \  
    # ZIP形式のファイルを解凍するためのツール
    unzip && \
    # APTキャッシュのクリーンアップ
    apt-get clean && \
    # APTリポジトリのメタデータを削除してディスクスペースを節約
    rm -rf /var/lib/apt/lists/*

###### Flyway CLIのダウンロード・インストール ######
# flywayリリースノート: https://github.com/flyway/flyway/releases

# Flyway CLIのバージョン
ARG FLYWAY_VERSION=11.6.0

# Flyway CLIのダウンロードURL
ARG FLYWAY_URL=https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}-linux-x64.tar.gz

# Flyway CLIのインストール
RUN set -eux && \
    # Flywayを指定されたURLからダウンロードし、一時ディレクトリに保存
    curl -L -o /tmp/flyway.tar.gz ${FLYWAY_URL} && \
    # 解凍先ディレクトリを作成
    mkdir -p /opt/flyway && \
    # ダウンロードしたtar.gzファイルを解凍し、指定ディレクトリに展開
    tar -xzf /tmp/flyway.tar.gz -C /opt/flyway --strip-components=1 && \
    # 解凍後、一時ファイルを削除
    rm /tmp/flyway.tar.gz

# 環境変数の設定
ENV FLYWAY_HOME=/opt/flyway
ENV PATH="${FLYWAY_HOME}:${PATH}"

# 作業ディレクトリの設定
WORKDIR /workspace

# ロケールの設定
ENV LANG=C.UTF-8

# 開発用フラグ
ENV DEVCONTAINER=true

# ✅ PostgreSQLを起動させる
CMD ["postgres"]
