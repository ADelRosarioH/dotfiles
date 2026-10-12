# Dev container starter

.NET 10 + Node 22 in one container, with Postgres, Mongo and Redis next to it.

```bash
cp -R ~/Projects/dotfiles/devcontainer/.devcontainer ./my-project/
```

Open the project in VS Code → **Reopen in Container**. Inside the app container the databases are at `postgres:5432`, `mongo:27017`, `redis:6379`.

- Faster on macOS: **Dev Containers: Clone Repository in Container Volume** (repo lives in a Docker volume, not a bind mount).
- Other .NET version: change the `app` image tag (`dotnet:9.0`).
- Node-only project: use `mcr.microsoft.com/devcontainers/typescript-node:22` and drop the node feature.
