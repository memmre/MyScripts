#!/bin/bash

# Display help message
function show_help() {
    echo "Usage: $0 [-y]"
    echo
    echo "Options:"
    echo "  -h, --help      Show this help message"
    echo "  -y, --yes       Apply changes immediately"
}

# Check for help option
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Check the current visibility status
status=$(defaults read com.apple.finder AppleShowAllFiles 2>/dev/null)

# Toggle the visibility of hidden items
if [ "$status" = "1" ]; then
    echo "Hiding hidden files..."
    defaults write com.apple.finder AppleShowAllFiles -bool false
else
    echo "Showing hidden files..."
    defaults write com.apple.finder AppleShowAllFiles -bool true
fi

# Apply changes
if [[ "$1" == "-y" || "$1" == "--yes" ]]; then
    killall Finder
    echo "Done."
else
    read -p "Restart Finder to apply changes? (y/N): " choice
    if [[ "$choice" == [Yy] ]]; then
        killall Finder
        echo "Done."
    else
        echo "Changes will take effect after the next Finder restart."
    fi
fi
