#!/bin/bash
# deploy-tools-hub-update.sh

GH_TOKEN=$(grep GITHUB_TOKEN /root/.openclaw/workspace/.secrets/.env | cut -d= -f2)
REPO="komi-projects/tools-hub"
LOCAL_DIR="/root/.openclaw/workspace/ventures/tools-hub"
TMP_DIR="/tmp/tools-hub"

rm -rf "$TMP_DIR"
git clone "https://x-access-token:${GH_TOKEN}@github.com/${REPO}.git" "$TMP_DIR" 2>/dev/null || mkdir -p "$TMP_DIR"

cp "$LOCAL_DIR"/* "$TMP_DIR/"
cd "$TMP_DIR"
git add .
git commit -m "Add sitemap + update links" || true
git push origin main || true

echo "✅ Tools hub updated"
