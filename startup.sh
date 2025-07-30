#!/bin/bash

# Create artifacts directory if using local storage
if [[ "$MLFLOW_DEFAULT_ARTIFACT_ROOT" != s3://* ]]; then
    echo "Using local artifact storage: $MLFLOW_DEFAULT_ARTIFACT_ROOT"
else
    echo "Using S3 artifact storage: $MLFLOW_DEFAULT_ARTIFACT_ROOT"
fi

# Start MLflow server
echo "Starting MLflow server..."
uv run mlflow server \
    --backend-store-uri "$MLFLOW_BACKEND_STORE_URI" \
    --default-artifact-root "$MLFLOW_DEFAULT_ARTIFACT_ROOT" \
    --host 0.0.0.0 \
    --port 5000