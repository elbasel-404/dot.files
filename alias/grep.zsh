grep.find.string() {
  grep -inrwH -- "$1" ./ | cut -d: -f1-2 | while IFS=: read -r file line; do
    echo "$(readlink -f "$file"):$line"
  done
}

grep_find_string_startswith() {
  if [ -z "$1" ]; then
    echo "Usage: grep_find_string_startswith <prefix>"
    return 1
  fi

  grep -inrwH -e "\b$1\w*" ./ | cut -d: -f1-2 | while IFS=: read -r file line; do
    echo "$(readlink -f "$file"):$line"
  done
}



