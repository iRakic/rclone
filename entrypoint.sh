#!/bin/bash

set -e

echo "Running rclone with arguments: $*"

# Ensure the RCLONE_CONF environment variable is set
if [[ -n "$RCLONE_CONF" ]]; then
  mkdir -p ~/.config/rclone
  echo "$RCLONE_CONF" > ~/.config/rclone/rclone.conf
fi

rclone "$@" | tee /dev/tty


