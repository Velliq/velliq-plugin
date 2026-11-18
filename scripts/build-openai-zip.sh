#!/bin/sh
# Builds the ChatGPT plugin package (portable format) into dist/velliq-openai.zip.
set -eu
root=$(cd "$(dirname "$0")/.." && pwd)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
cp "$root/openai/plugin.json" "$work/plugin.json"
cp "$root/openai/mcp.json" "$work/mcp.json"
cp -R "$root/skills" "$work/skills"
cp -R "$root/assets" "$work/assets"
cp "$root/README.md" "$root/LICENSE" "$work/"
mkdir -p "$root/dist"
rm -f "$root/dist/velliq-openai.zip"
(cd "$work" && zip -qrX "$root/dist/velliq-openai.zip" . -x '*.DS_Store')
echo "$root/dist/velliq-openai.zip"
