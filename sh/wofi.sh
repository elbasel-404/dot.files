#!/usr/bin/bash
# Improved wofi application launcher
# Launches applications using wofi with proper error handling and validation

set -euo pipefail

# Configuration
WOFI_OPTS=(
    --show=drun
    --insensitive
    --allow-images
    --width=600
    --height=400
    --prompt="Launch: "
)

# Function to launch application
launch_app() {
    local selected_app

    # Get the selected application from wofi
    if ! selected_app=$(wofi "${WOFI_OPTS[@]}" 2>/dev/null); then
        # User cancelled or wofi failed
        exit 0
    fi

    # Check if something was actually selected
    if [[ -z "$selected_app" ]]; then
        exit 0
    fi

    # Launch the application in the background
    # Use setsid to detach from the terminal session
    if command -v setsid >/dev/null 2>&1; then
        "$selected_app" >/dev/null 2>&1 &
    else
        # Fallback if setsid is not available
        nohup "$selected_app" >/dev/null 2>&1 &
        disown
    fi
}

# Function to check dependencies
check_dependencies() {
    if ! command -v wofi >/dev/null 2>&1; then
        echo "Error: wofi is not installed or not in PATH" >&2
        exit 1
    fi
}

# Main execution
main() {
    check_dependencies
    launch_app
}

# Only run if script is executed directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
