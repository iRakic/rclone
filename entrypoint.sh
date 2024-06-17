#!/bin/bash

set -e

echo "### Starting RClone :rocket:" >> $GITHUB_STEP_SUMMARY


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

sh -c "rclone $*" 

