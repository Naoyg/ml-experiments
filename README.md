# MLflow Tracking Server with Docker

MLflowのtracking serverをDockerで実行し、artifact storeとしてS3またはlocalファイルシステムを選択できます。

## 必要なファイル

- `compose.yaml`: Docker Compose設定
- `.env.local`: ローカルストレージ用環境変数
- `.env.s3`: S3ストレージ用環境変数
- `startup.sh`: MLflowサーバー起動スクリプト

## 使用方法

### 1. ローカルストレージを使用する場合

```bash
# 環境変数ファイルをコピー
cp .env.local .env

# Docker Composeで起動
docker compose up -d
```

### 2. S3ストレージを使用する場合

```bash
# 環境変数ファイルをコピー
cp .env.s3 .env

# .envファイルを編集してAWS認証情報を設定
# - AWS_ACCESS_KEY_ID
# - AWS_SECRET_ACCESS_KEY
# - MLFLOW_DEFAULT_ARTIFACT_ROOT (S3バケットパス)

# Docker Composeで起動
docker compose up -d
```

## アクセス

- MLflow UI: http://localhost:5000
- PostgreSQL: localhost:5555

## 停止

```bash
docker compose down
```

## データの永続化

- PostgreSQLデータ: `postgres_data` Dockerボリューム
- ローカルartifacts: `./mlflow-artifacts` ディレクトリ
