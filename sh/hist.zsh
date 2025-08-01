# runHist() {
#   # Prepare history commands with timestamps, dedupe, etc.
#   local histfile="${HISTFILE:-$HOME/.zsh_history}"
#   local tmpfile="$(mktemp)"

#   LC_ALL=C.UTF-8 awk '
#     BEGIN { FS=";" }
#     $0 ~ /^: [0-9]+:[0-9]+;/ {
#       timestamp = substr($0, 3, index($0, ":") - 3)
#       cmd = $0
#       sub(/^: [0-9]+:[0-9]+;/, "", cmd)
#       if (!seen[cmd]++) {
#         printf "%s │ %s\n", strftime("%Y-%m-%d %H:%M:%S", timestamp), cmd
#       }
#     }
#   ' "$histfile" | tac >"$tmpfile"

#   local fzf_output
#   # Use --expect to differentiate between Enter and Tab.
#   # enter: execute the command.
#   # tab: put command in buffer for editing.
#   fzf_output=$(fzf --prompt=" Zsh History > " --height=40% --layout=reverse --ansi \
#     --preview="awk -F '│' '{print \$2}' <<< {} | bat --style=plain --color=always" \
#     --bind=tab:accept \
#     --expect=enter,tab \
#     --preview-window=down:4:wrap <"$tmpfile")

#   rm -f "$tmpfile"

#   if [[ -z "$fzf_output" ]]; then
#     # fzf cancelled (e.g., Esc) or no selection.
#     return
#   fi

#   local key_name=""
#   local selected_item=""

#   # Parse fzf output: first line is key (if from --expect), subsequent is selection.
#   local -a lines # Zsh specific: split string by newlines into array
#   # lines=("${(@f)fzf_output}") # Original line, reported to cause "parameter expansion requires a literal"

#   # Correctly split fzf_output into the 'lines' array
#   lines=()
#   while IFS= read -r line; do
#     lines+=("$line")
#   done < <(print -rl -- "$fzf_output")

#   # Check if the first line is one of the expected keys
#   if [[ "${#lines[@]}" -gt 1 && ("${lines[1]}" == "enter" || "${lines[1]}" == "tab") ]]; then
#     key_name="${lines[1]}"
#     selected_item="${lines[2]}" # Assuming single selection, item is on the second line
#   else
#     # Default accept (e.g. mouse click, or Enter if not named 'enter' in --expect, or if output is single line)
#     selected_item="${lines[1]}"
#   fi

#   if [[ -n "$selected_item" ]]; then
#     # Extract the actual command string from the formatted selection
#     local cmd=$(awk -F '│' '{print $2}' <<<"$selected_item" | sed 's/^ *//')

#     if [[ -n "$cmd" ]]; then
#       print -z -- "$cmd" # Put command in ZLE buffer

#       if [[ "$key_name" == "enter" || -z "$key_name" ]]; then
#         # Execute if 'enter' was pressed, or if no specific key from --expect (default action)
#         zle accept-line
#       elif [[ "$key_name" == "tab" ]]; then
#         # Command is in buffer for editing, do nothing more (ZLE buffer already updated).
#         :
#       fi
#     fi
#   fi
# }
