#!/usr/bin/env bash

cd "${1:-$PWD}"

if [[ -f "Cargo.toml" ]]; then
  echo "---> Detected Rust project"
  cargo build

elif [[ -f "package.json" ]]; then
  echo "---> Detected Node.js project"
  npm run build

elif [[ -f "pyproject.toml" ]]; then
  echo "---> Detected Python project (poetry)"
  poetry build

elif [[ -f "Makefile" ]]; then
  echo "---> Detected Makefile"
  make

# - - - - - - - - - - - - - - - - 
# elif [[ -f "Custom" ]]; then
#   echo "---> Detected Custom"
#   buildcommand

else
  echo "[X] No known build system found in $(pwd)"
  exit 1
fi
