#!/bin/bash

set -e

# Log function for better readability and debugging
log() {
  echo "::debug::$1" >> $GITHUB_OUTPUT
}

# Ensure the RCLONE_CONF environment variable is set
if [[ -n "$RCLONE_CONF" ]]; then
  log "Setting up rclone config..." >> $GITHUB_OUTPUT
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
output=$(sh -c "rclone $*" 2>&1)
exit_code=$?
echo "$output" >> $GITHUB_OUTPUT

if [[ $exit_code -ne 0 ]]; then
  echo "::error::Rclone command failed with exit code $exit_code." >> $GITHUB_OUTPUT
  exit $exit_code
fi

log "Rclone command finished successfully." >> $GITHUB_OUTPUT