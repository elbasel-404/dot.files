# Enhanced Application Launcher Script
# Features: App launching, search integration, history, fuzzy matching, and more

set -euo pipefail  # Enable strict error handling

# Configuration
readonly SCRIPT_NAME="$(basename "$0")"
readonly CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/app-launcher"
readonly HISTORY_FILE="$CONFIG_DIR/history"
readonly CONFIG_FILE="$CONFIG_DIR/config"
readonly LOCKFILE="/tmp/${SCRIPT_NAME}.lock"
readonly MAX_HISTORY=20
readonly DEFAULT_BROWSER="flatpak run com.brave.Browser"

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Create config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Default application URLs
declare -A app_urls=(
    [Discord]="https://discord.com/channels/@me"
    [GmailAlpha]="https://mail.google.com/mail/u/0/#inbox"
    [GmailBeta]="https://mail.google.com/mail/u/1/#inbox"
    [GmailDelta]="https://mail.google.com/mail/u/2/#inbox"
    ["Nix Options"]="https://search.nixos.org/options"
    ["Nix Packages"]="https://search.nixos.org/packages"
    [GitHub]="https://github.com"
    [YouTube]="https://youtube.com"
    [ChatGPT]="https://chat.openai.com"
    [Reddit]="https://reddit.com"
    [Twitter]="https://twitter.com"
    [Telegram]="https://web.telegram.org/"
    [WhatsApp]="https://web.whatsapp.com/"
    [Azure]="https://dev.azure.com/Algoriza/Monshaat/_git/temp-portal-repo"
    [Gemini]="https://gemini.google.com/app"
    [AIStudio]="https://aistudio.google.com/"
    [Calendar]="https://calendar.google.com/"
    [Meet]="https://meet.google.com/landing?lfhs=2"
    [NotebookLM]="https://notebooklm.google.com/"
    [Passwords]="brave://password-manager/passwords"
    [Photopea]="https://www.photopea.com/"
    [VPN]="https://vpn.monshaat.gov.sa/my.policy"
    [Music]="https://music.youtube.com/"
    ["localhost:3000"]="http://localhost:3000/"
    [Claude]="https://claude.ai/"
    [Netflix]="https://netflix.com"
    [Spotify]="https://open.spotify.com"
    [HiAnime]="https://hianime.to/"
)

# Default search engines
declare -A search_engines=(
    [g]="https://www.google.com/search?q="
    [y]="https://www.youtube.com/results?search_query="
    [r]="https://www.reddit.com/search/?q="
    [w]="https://en.wikipedia.org/wiki/Special:Search?search="
    [gh]="https://github.com/search?q="
    [ddg]="https://duckduckgo.com/?q="
    [so]="https://stackoverflow.com/search?q="
    [mdn]="https://developer.mozilla.org/en-US/search?q="
    [npm]="https://www.npmjs.com/search?q="
    [pypi]="https://pypi.org/search/?q="
)

# Utility functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $*" >&2
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $*" >&2
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

# Check if required commands exist
check_dependencies() {
    local deps=("wofi")
    local missing=()
    
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing+=("$dep")
        fi
    done
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        log_error "Missing dependencies: ${missing[*]}"
        log_info "Please install missing dependencies and try again"
        exit 1
    fi
}

# Load custom configuration
load_config() {
    if [[ -f "$CONFIG_FILE" ]]; then
        source "$CONFIG_FILE" 2>/dev/null || {
            log_warn "Failed to load config file: $CONFIG_FILE"
        }
    fi
}

# Save current selection to history
save_to_history() {
    local selection="$1"
    [[ -z "$selection" ]] && return
    
    # Remove existing entry if present
    if [[ -f "$HISTORY_FILE" ]]; then
        grep -v "^$selection$" "$HISTORY_FILE" > "${HISTORY_FILE}.tmp" 2>/dev/null || true
        mv "${HISTORY_FILE}.tmp" "$HISTORY_FILE" 2>/dev/null || true
    fi
    
    # Add to top of history
    {
        echo "$selection"
        [[ -f "$HISTORY_FILE" ]] && head -n $((MAX_HISTORY - 1)) "$HISTORY_FILE"
    } > "${HISTORY_FILE}.tmp"
    
    mv "${HISTORY_FILE}.tmp" "$HISTORY_FILE"
}

# Get history entries
get_history() {
    [[ -f "$HISTORY_FILE" ]] && cat "$HISTORY_FILE" 2>/dev/null || true
}

# URL encoding for search queries
url_encode() {
    local string="$1"
    local encoded=""
    local pos=0
    
    for (( pos=0; pos<${#string}; pos++ )); do
        local char="${string:pos:1}"
        case "$char" in
            [a-zA-Z0-9.~_-]) encoded+="$char" ;;
            ' ') encoded+='+' ;;
            *) encoded+="%$(printf '%02X' "'$char")" ;;
        esac
    done
    
    echo "$encoded"
}

# Launch URL with specified browser
launch_url() {
    local url="$1"
    local browser="${2:-$DEFAULT_BROWSER}"
    
    log_info "Launching: $url"
    
    # Check if it's a local application URL
    if [[ "$url" =~ ^brave:// ]]; then
        $browser "$url" &
    else
        $browser --app="$url" &
    fi
    
    # Detach from terminal
    disown 2>/dev/null || true
}

# Fuzzy search for app names
fuzzy_search() {
    local query="$1"
    local -a matches=()
    
    # Convert query to lowercase for case-insensitive matching
    local lower_query="${query,,}"
    
    # Search in app URLs
    for app in "${!app_urls[@]}"; do
        local lower_app="${app,,}"
        if [[ "$lower_app" == *"$lower_query"* ]]; then
            matches+=("$app")
        fi
    done
    
    printf '%s\n' "${matches[@]}"
}

# Handle special commands
handle_special_commands() {
    local selection="$1"
    
    case "$selection" in
        ":help"|":h")
            show_help
            exit 0
            ;;
        ":config"|":c")
            "${EDITOR:-nano}" "$CONFIG_FILE"
            exit 0
            ;;
        ":history"|":hist")
            get_history
            exit 0
            ;;
        ":clear-history"|":ch")
            > "$HISTORY_FILE"
            log_info "History cleared"
            exit 0
            ;;
        ":reload"|":r")
            exec "$0" "$@"
            ;;
        ":quit"|":q")
            exit 0
            ;;
    esac
}

# Show help information
show_help() {
    cat << 'EOF'
Enhanced App Launcher - Help

USAGE:
  Run the script to open the launcher menu

FEATURES:
  • Launch predefined applications
  • Search with various search engines
  • History tracking with fuzzy search
  • Custom configuration support
  • URL validation and encoding

SEARCH SYNTAX:
  prefix:query    - Search with specific engine (e.g., "g:bash scripting")
  prefix: query   - Alternative syntax
  
SEARCH PREFIXES:
  g     - Google
  y     - YouTube  
  r     - Reddit
  w     - Wikipedia
  gh    - GitHub
  ddg   - DuckDuckGo
  so    - StackOverflow
  mdn   - MDN Web Docs
  npm   - NPM Registry
  pypi  - Python Package Index

SPECIAL COMMANDS:
  :help, :h              - Show this help
  :config, :c            - Edit configuration
  :history, :hist        - Show history
  :clear-history, :ch    - Clear history
  :reload, :r            - Reload script
  :quit, :q              - Exit

CONFIGURATION:
  Config file: ~/.config/app-launcher/config
  Add custom apps and search engines by defining arrays in the config file.

EXAMPLES:
  Discord                - Launch Discord
  g:bash tutorial        - Google search for "bash tutorial"
  gh:user/repo          - Search GitHub for "user/repo"
  :help                 - Show this help
EOF
}

# Build menu items with history prioritization
build_menu() {
    local -a menu_items=()
    local -a history_items=()
    local -a app_items=()
    local -a search_items=()
    
    # Get history items that still exist
    while IFS= read -r item; do
        if [[ -n "${app_urls[$item]:-}" ]] || [[ "$item" =~ ^[^:]+:.*$ ]]; then
            history_items+=("🕒 $item")
        fi
    done < <(get_history)
    
    # Add regular app items
    for app in $(printf '%s\n' "${!app_urls[@]}" | sort); do
        app_items+=("📱 $app")
    done
    
    # Add search prefixes
    for prefix in $(printf '%s\n' "${!search_engines[@]}" | sort); do
        search_items+=("🔍 ${prefix}:")
    done
    
    # Combine all items (history first, then apps, then searches)
    menu_items+=("${history_items[@]}")
    [[ ${#history_items[@]} -gt 0 && ${#app_items[@]} -gt 0 ]] && menu_items+=("---")
    menu_items+=("${app_items[@]}")
    [[ ${#app_items[@]} -gt 0 && ${#search_items[@]} -gt 0 ]] && menu_items+=("---")
    menu_items+=("${search_items[@]}")
    
    printf '%s\n' "${menu_items[@]}"
}

# Process user selection
process_selection() {
    local selection="$1"
    
    [[ -z "$selection" ]] && exit 0
    
    # Remove emoji prefixes and clean up
    selection="${selection#🕒 }"
    selection="${selection#📱 }"
    selection="${selection#🔍 }"
    
    # Skip separator lines
    [[ "$selection" == "---" ]] && exit 0
    
    # Handle special commands
    handle_special_commands "$selection"
    
    # Handle search queries
    for prefix in "${!search_engines[@]}"; do
        local base_url="${search_engines[$prefix]}"
        if [[ "$selection" == "$prefix:"* ]]; then
            local query="${selection#*:}"
            query="${query# }"  # Remove leading space if present
            
            if [[ -n "$query" ]]; then
                local encoded_query
                encoded_query=$(url_encode "$query")
                save_to_history "$selection"
                launch_url "${base_url}${encoded_query}"
                exit 0
            else
                log_warn "Empty search query for prefix: $prefix"
                exit 1
            fi
        fi
    done
    
    # Handle direct app URLs
    if [[ -n "${app_urls[$selection]:-}" ]]; then
        save_to_history "$selection"
        launch_url "${app_urls[$selection]}"
        exit 0
    fi
    
    # Try fuzzy search
    local -a matches
    readarray -t matches < <(fuzzy_search "$selection")
    
    if [[ ${#matches[@]} -eq 1 ]]; then
        save_to_history "${matches[0]}"
        launch_url "${app_urls[${matches[0]}]}"
        exit 0
    elif [[ ${#matches[@]} -gt 1 ]]; then
        log_info "Multiple matches found:"
        printf '%s\n' "${matches[@]}" | head -5
        exit 1
    fi
    
    log_warn "No matching application or search pattern found: $selection"
    exit 1
}

# Prevent multiple instances
acquire_lock() {
    exec 200>"$LOCKFILE"
    if ! flock -n 200; then
        log_warn "Another instance is already running"
        exit 1
    fi
}

# Main function
main() {
    local selection
    
    # Acquire lock to prevent multiple instances
    acquire_lock
    
    # Parse command line arguments
    case "${1:-}" in
        --help|-h)
            show_help
            exit 0
            ;;
        --config|-c)
            "${EDITOR:-nano}" "$CONFIG_FILE"
            exit 0
            ;;
        --version|-v)
            echo "$SCRIPT_NAME version 2.0"
            exit 0
            ;;
    esac
    
    # Check dependencies
    check_dependencies
    
    # Load configuration
    load_config
    
    # Build and display menu
    selection=$(build_menu | wofi \
        --dmenu \
        --insensitive \
        --prompt "🚀 App Launcher" \
        --width 600 \
        --height 400 \
        --lines 15 \
        --cache-file /dev/null)
    
    # Process the selection
    process_selection "$selection"
}

# Trap to cleanup on exit
trap 'rm -f "$LOCKFILE"' EXIT

# Run main function with all arguments
main "$@"