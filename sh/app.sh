#!/usr/bin/env zsh

# Define application URLs
typeset -A app_urls=(
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
  ["Calendar"]="https://calendar.google.com/"
  ["Meet"]="https://meet.google.com/landing?lfhs=2"
  ["NotebookLM"]="https://notebooklm.google.com/"
  [Passwords]="brave://password-manager/passwords"
  [Photopea]="https://www.photopea.com/"
  [VPN]="https://vpn.monshaat.gov.sa/my.policy"
  ["Music"]="https://music.youtube.com/"
  ["localhost:3000"]="http://localhost:3000/"
)

# Define custom search entries with their base URLs
typeset -A custom_searches=(
  [g]="https://www.google.com/search?q="
  [y]="https://www.youtube.com/results?search_query="
  [r]="https://www.reddit.com/search/?q="
  [w]="https://en.wikipedia.org/wiki/Special:Search?search="
  [gh]="https://github.com/search?q="
)

# Display menu and get user selection
menu_items=("${(@k)app_urls}" "${(@k)custom_searches[@]/%/: }")
selected=$(printf "%s\n" "${menu_items[@]}" | wofi --dmenu --insensitive --prompt "Select App or Search")

# Helper function to launch a URL in Brave
launch_url() {
  brave --app="$1" &
}

# Process user selection
if [[ -n "$selected" ]]; then
  # Handle custom searches
  for prefix base_url in "${(@kv)custom_searches}"; do
    if [[ "$selected" == "$prefix: "* ]]; then
      query="${selected#*: }"
      formatted_query="${(j:+:)${(s: :)query}}"
      launch_url "${base_url}${formatted_query}"
      exit
    fi
  done

  # Handle app URLs
  if [[ -n "${app_urls[$selected]}" ]]; then
    launch_url "${app_urls[$selected]}"
  fi
fi
