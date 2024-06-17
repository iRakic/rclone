#!/bin/bash

set -e

# Log function for better readability and debugging
log() {
  echo "::debug::$1"
}

# Ensure the RCLONE_CONF environment variable is set
if [[ -n "$RCLONE_CONF" ]]; then
  log "Setting up rclone config..."
  mkdir -p ~/.config/rclone
  echo "$RCLONE_CONF" > ~/.config/rclone/rclone.conf
fi

# Check if rclone command is provided
if [[ -z "$*" ]]; then
  echo "::error::No rclone command provided."
  exit 1
fi

# Execute rclone command
log "Executing rclone command..."
rclone "$@"
log "Rclone command finished successfully."