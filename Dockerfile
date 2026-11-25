# Opsily deploy of docling-serve for OpenWebUI.
# Add this file to the root of your docling-serve fork. Opsily builds from a file
# named "Dockerfile"; upstream only ships a "Containerfile", which is a heavy
# multi-stage build (CUDA torch, BuildKit mounts). Building FROM the official
# CPU-only image is quicker and more reliable.
FROM quay.io/docling-project/docling-serve-cpu:v1.39.0

ENV PORT=5001 \
    DOCLING_SERVE_ENABLE_UI=false \
    UVICORN_HOST=0.0.0.0 \
    UVICORN_PORT=5001 \
    UVICORN_WORKERS=1 \
    DOCLING_SERVE_ENG_LOC_NUM_WORKERS=2 \
    DOCLING_SERVE_MAX_SYNC_WAIT=600 \
    OMP_NUM_THREADS=4

EXPOSE 5001

CMD ["docling-serve", "run"]
