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

# An optional end notification using buyshell
msg="echo -e '\n\n\n\n         🚀  \033[1;32mBuild Finished Successfully\033[0m\n\n\n\n'; read -p 'Press Enter to close...'; tmux detach-client"
tmux run-shell "custom_buoy ephemeral notification \"$msg\""
