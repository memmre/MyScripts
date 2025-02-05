#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <name>"
  exit 1
fi

FEATURE_PATH="$1"

mkdir -p "$FEATURE_PATH/models" \
         "$FEATURE_PATH/services" \
         "$FEATURE_PATH/view_models" \
         "$FEATURE_PATH/views/components" \
         "$FEATURE_PATH/views/pages" \
         "$FEATURE_PATH/views/widgets"
