#!/usr/bin/env bash
# Runs once when the container is created.
set -e
ls ./*.sln ./*.slnx >/dev/null 2>&1 && dotnet restore || true
[ -f .config/dotnet-tools.json ] && dotnet tool restore || true
[ -f package.json ] && { corepack enable; [ -f pnpm-lock.yaml ] && pnpm install || npm install; } || true
