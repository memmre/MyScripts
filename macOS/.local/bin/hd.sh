#!/bin/bash

# Display help message
function show_help() {
    echo "Usage: $0 [-u] /path/to/file_or_folder"
    echo
    echo "Options:"
    echo "  -h, --help      Show this help message."
    echo "  -u, --unhide    Unhide the specified file or folder."
}

# Validate parameters
if [[ $# -lt 1 || $# -gt 2 ]]; then
    show_help
    exit 1
fi

# Check for help option
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Determine action
ACTION="hide"
TARGET="$1"

if [[ "$1" == "-u" || "$1" == "--unhide" ]]; then
    ACTION="unhide"
    TARGET="$2"
fi

# Check if target exists
if [[ ! -e "$TARGET" ]]; then
    echo "Error: '$TARGET' not found."
    exit 1
fi

# Perform action
if [[ "$ACTION" == "hide" ]]; then
    chflags hidden "$TARGET"
else
    chflags nohidden "$TARGET"
fi
