#!/usr/bin/env zsh

# Zsh startup profiling script using zmodload zsh/datetime
zmodload zsh/datetime

echo "Starting zsh profiling..."
start_time=$EPOCHREALTIME

echo "Sourcing ~/.profile..."
profile_start=$EPOCHREALTIME
source ~/.profile
profile_end=$EPOCHREALTIME
profile_time=$((profile_end - profile_start))
printf "~/.profile took: %.3fs\n" $profile_time

echo "Setting up starship..."
starship_start=$EPOCHREALTIME
eval "$(starship init zsh)"
starship_end=$EPOCHREALTIME
starship_time=$((starship_end - starship_start))
printf "Starship init took: %.3fs\n" $starship_time

echo "Setting up fzf..."
fzf_start=$EPOCHREALTIME
if [ -n "${commands[fzf - share]}" ]; then
	source "$(fzf-share)/key-bindings.zsh"
	source "$(fzf-share)/completion.zsh"
fi
fzf_end=$EPOCHREALTIME
fzf_time=$((fzf_end - fzf_start))
printf "FZF setup took: %.3fs\n" $fzf_time

echo "Setting up atuin..."
atuin_start=$EPOCHREALTIME
eval "$(atuin init zsh)"
atuin_end=$EPOCHREALTIME
atuin_time=$((atuin_end - atuin_start))
printf "Atuin init took: %.3fs\n" $atuin_time

echo "Setting up completions..."
comp_start=$EPOCHREALTIME
fpath=($HOME/config/zsh/comp $fpath)
autoload -U compinit
compinit
comp_end=$EPOCHREALTIME
comp_time=$((comp_end - comp_start))
printf "Completions took: %.3fs\n" $comp_time

end_time=$EPOCHREALTIME
total_time=$((end_time - start_time))
printf "Total profiling time: %.3fs\n" $total_time
