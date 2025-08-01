#!/usr/bin/env bash

# Use safe delimiter and fallback display
delimiter="::"

# Generate file list with clear labels and safe delimiter
files=$(git status --short)

# Format and extract entries
listed=$(echo "$files" | awk -v d="$delimiter" '
  {
    if ($1 ~ /^M/) print "STAGED" d $2;
    else if ($1 ~ /^.M/) print "UNSTAGED" d $2;
    else if ($1 ~ /^\?\?/) print "UNTRACKED" d $2;
  }')

count=$(echo "$listed" | wc -l)

if [ "$count" -eq 0 ]; then
  gum style --foreground 1 "🎉 No changed files."
  exit 0
fi

gum style --foreground 2 "📁 $count changed file(s):"

# TUI selection
selected=$(echo "$listed" | gum choose --no-limit --height=15 --header="Select file(s) to act on" --cursor="👉")

# If nothing selected, exit
[ -z "$selected" ] && exit 0

# Loop over selections
echo "$selected" | while IFS= read -r entry; do
  state="${entry%%$delimiter*}"
  file="${entry#*$delimiter}"

  if [[ -z "$file" ]]; then
    gum style --foreground 1 "⚠️ Skipping invalid entry: $entry"
    continue
  fi

  case "$state" in
    STAGED)
      gum style --foreground 6 "🔍 git diff --cached -- $file"
      git diff --cached -- "$file" | gum pager || echo "❌ No diff output."
      ;;
    UNSTAGED)
      gum style --foreground 6 "🔍 git diff -- $file"
      git diff -- "$file" | gum pager || echo "❌ No diff output."
      ;;
    UNTRACKED)
      gum style --foreground 6 "📖 Viewing untracked file: $file"
      bat --style=plain --paging=always "$file" || cat "$file"
      ;;
    *)
      gum style --foreground 1 "❌ Unknown state: $state"
      ;;
  esac
done
