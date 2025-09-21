#
# Dynamic 'ag' command builder for Zsh
# Allows for chained commands like `ag.literal.hidden.count "pattern"`
#
command_not_found_handler() {
  # Check if the unknown command starts with "ag."
  if [[ "$1" == ag.* ]]; then
    local cmd="$1"
    shift # Remove the function name from the arguments list

    # Remove 'ag.' prefix and split the rest by dots
    local options_str=${cmd#ag.}
    local -a options=( ${(s:.:)options_str} )
    
    local -a ag_opts
    
    # Map the keywords from the command name to actual ag flags
    for opt in "${options[@]}"; do
      case "$opt" in
        # Behavior
        literal)          ag_opts+=("-Q");;
        word)             ag_opts+=("-w");;
        insensitive)      ag_opts+=("-i");;
        invert)           ag_opts+=("-v");;
        binary)           ag_opts+=("--search-binary");;

        # File Filtering
        list)             ag_opts+=("-l");;
        list_without)     ag_opts+=("-L");;
        text)             ag_opts+=("-t");;
        all_types)        ag_opts+=("-a");;
        unrestricted)     ag_opts+=("-u");;
        hidden)           ag_opts+=("--hidden");;
        symlinks)         ag_opts+=("-f");;
        no_recurse)       ag_opts+=("-n");;
        no_vcs_ignores)   ag_opts+=("-U");;
        zip)              ag_opts+=("-z");;
        
        # Output
        count)            ag_opts+=("-c");;
        column)           ag_opts+=("--column");;
        only_matching)    ag_opts+=("-o");;
        stats)            ag_opts+=("--stats");;
        vimgrep)          ag_opts+=("--vimgrep");;
        xargs)            ag_opts+=("-0");; # for null-termination
        *)
          echo "ag function error: Unknown option '$opt' in command '$cmd'" >&2
          return 127
          ;;
      esac
    done
    
    # Execute the real ag command with the constructed options
    command ag "${ag_opts[@]}" "$@"
    return $?
  fi
  
  # Default handler for other "command not found" errors
  echo "zsh: command not found: $1" >&2
  return 127
}
