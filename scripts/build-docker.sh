#!/bin/sh
set -eu

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker was not found."
  echo "Install Docker Desktop, start it, then run this command again."
  exit 1
fi

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$repo_root"

host_repo="$repo_root"
if command -v cygpath >/dev/null 2>&1; then
  host_repo="$(cygpath -w "$repo_root")"
fi

echo "Building Jekyll site in Docker..."

MSYS_NO_PATHCONV=1 docker build \
  -t rohit-jekyll-builder \
  -f .docker/jekyll/Dockerfile \
  .

MSYS_NO_PATHCONV=1 docker run --rm \
  -v "$host_repo:/site" \
  -v rohit-jekyll-bundle-cache:/usr/local/bundle \
  -w /site \
  -e JEKYLL_ENV=production \
  rohit-jekyll-builder \
  sh -lc 'bundle install && bundle exec jekyll build'
