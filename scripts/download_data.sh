#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/download_data.sh <competition-slug>
# Example: ./scripts/download_data.sh titanic

COMP=${1:-}
if [ -z "$COMP" ]; then
  echo "Usage: $0 <competition-slug>" >&2
  exit 1
fi

mkdir -p data/raw
kaggle competitions download -c "$COMP" -p data/raw
# Unzip all archives to data/raw
find data/raw -name "*.zip" -exec unzip -o {} -d data/raw \;
