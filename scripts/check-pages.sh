#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

required_files=(
  "$ROOT_DIR/index.html"
  "$ROOT_DIR/privacy/index.html"
  "$ROOT_DIR/support/index.html"
  "$ROOT_DIR/fairway-fortune/index.html"
  "$ROOT_DIR/fairway-fortune/privacy/index.html"
  "$ROOT_DIR/fairway-fortune/support/index.html"
)

required_strings=(
  "https://zboxgames.com/privacy"
  "https://zboxgames.com/support"
  "https://zboxgames.com/fairway-fortune/"
  "https://zboxgames.com/fairway-fortune/privacy/"
  "https://zboxgames.com/fairway-fortune/support/"
  "zboxgamessupport@gmail.com"
  "BioForge does not collect personal information."
  "Fairway Fortune stores gameplay progress on your device"
  "Golden Ball purchases use Apple StoreKit"
  "Rewarded ads are optional"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "Missing website file: $file" >&2
    exit 1
  fi
done

combined_pages="$(mktemp)"
trap 'rm -f "$combined_pages"' EXIT
cat "${required_files[@]}" > "$combined_pages"

for text in "${required_strings[@]}"; do
  if ! grep -Fq "$text" "$combined_pages"; then
    echo "Missing required public website text: $text" >&2
    exit 1
  fi
done

for forbidden in \
  "Before publishing" \
  "For App Review" \
  "Apple Developer Program enrollment" \
  "App Store Connect setup" \
  "localhost" \
  "127.0.0.1" \
  "file://"
do
  if grep -Fq "$forbidden" "$combined_pages"; then
    echo "Forbidden public website text found: $forbidden" >&2
    exit 1
  fi
done

echo "Website pages passed local publishing checks."
