# Opsily deploy of docling-serve for OpenWebUI.
# Opsily builds from a file named "Dockerfile" (upstream only ships a heavy "Containerfile"),
# so this builds FROM the official CPU-only image instead.
FROM quay.io/docling-project/docling-serve-cpu:v1.39.0

ENV DOCLING_SERVE_ENABLE_UI=false \
    UVICORN_HOST=0.0.0.0 \
    UVICORN_WORKERS=1 \
    DOCLING_SERVE_ENG_LOC_NUM_WORKERS=2 \
    DOCLING_SERVE_MAX_SYNC_WAIT=600 \
    OMP_NUM_THREADS=4

EXPOSE 5001

# Opsily chooses the port and passes it in $PORT; docling-serve listens on $UVICORN_PORT.
CMD ["sh", "-c", "export UVICORN_PORT=\"${PORT:-5001}\"; echo \"Listening on port $UVICORN_PORT\"; exec docling-serve run"]
