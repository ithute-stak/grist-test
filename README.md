# Grist Test

Disposable deployment target for validating the Custom GitHub / Ithute GitHub local CI/CD control plane before using production applications.

## Expected pipeline

1. Sync this repository from GitHub.
2. Build `custom-github/grist-test:<commit-sha>` on the local PC.
3. Require a green pipeline for the exact synced SHA.
4. Check VPS capacity before deployment.
5. Stream the already-built image to the VPS over SSH.
6. Activate it with Docker Compose using `--no-build`.
7. Verify the HTTP health endpoint.
8. Keep the previous image available for rollback.

## Runtime

- Service: `grist`
- Port: `8484`
- Persistent data: `grist_test_data:/persist`
- Suggested VPS directory: `/opt/apps/grist-test`
- Suggested health URL: `http://<VPS-IP>:8484/`

The VPS should never clone or build this repository during deployment.
