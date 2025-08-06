#!/bin/bash
watch -n 1 '
  echo "=== ZRAM Swap Usage ==="
  grep -E "SwapTotal|SwapFree|SwapCached" /proc/meminfo
  echo
  echo "=== Top memory consumers ==="
  ps -eo pid,comm,%mem --sort=-%mem | head -n 30 | less
'
