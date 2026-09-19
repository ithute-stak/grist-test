FROM gristlabs/grist:latest

EXPOSE 8484

HEALTHCHECK --interval=15s --timeout=5s --start-period=30s --retries=10 \
  CMD curl -fsS http://127.0.0.1:8484/ || exit 1
