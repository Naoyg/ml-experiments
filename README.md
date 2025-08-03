# MLflow Tracking Server with Docker

MLflowのtracking serverを実行する。

## 使用方法

```bash
# 環境変数ファイルをコピー
cp .env.example .env

# .envに必要な値を記入

# Docker Composeで起動
docker compose up -d
```

## 停止

```bash
docker compose down
```

## example
jupyter labを起動する。

```bash
uv run --with jupyterlab jupyter lab
```

- [notebooks/mlflow-example.ipynb](./notebooks/mlflow-example.ipynb): mlflowの基本的な使用方法。
