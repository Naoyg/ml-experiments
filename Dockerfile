# builder for installing python packages
FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim as builder

RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# プロジェクトファイルをコピー
COPY pyproject.toml uv.lock ./

# 依存関係のインストール
RUN uv sync --frozen --no-cache

# open port 5000
EXPOSE 5000

# set environment variables
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG DB_HOST
ARG DB_NAME
ARG DEFAULT_ARTIFACT_ROOT
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV DB_HOST=${DB_HOST}
ENV DB_NAME=${DB_NAME}
ENV DEFAULT_ARTIFACT_ROOT=${DEFAULT_ARTIFACT_ROOT}

# Start mlflow server
CMD uv run mlflow server \
    --host 0.0.0.0 \
    --port 5000 \
    --backend-store-uri mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@${DB_HOST}:3306/${DB_NAME} \
    --default-artifact-root ${DEFAULT_ARTIFACT_ROOT}
