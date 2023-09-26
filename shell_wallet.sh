#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
COMMANDS_FILE="$SCRIPT_DIR/commands.txt"

if [[ ! -f "$COMMANDS_FILE" ]]; then
  echo "Error: $COMMANDS_FILE not found!"
  exit 1
fi

commands=()
while IFS= read -r line || [[ -n "$line" ]]; do
  commands+=("$line")
done < "$COMMANDS_FILE"

echo "Commands:"
idx=1
for cmd in "${commands[@]}"; do
  echo "$idx. $cmd"
  idx=$((idx+1))
done

read -p "Select a command (Example: '2' or '2!'): " choice

execute=false
if [[ $choice == *'!'* ]]; then
  execute=true
  choice=${choice%!} # Remove the '!'
fi

if [[ ! $choice =~ ^[0-9]+$ || $choice -lt 1 || $choice -gt ${#commands[@]} ]]; then
  echo "Invalid selection."
  exit 1
fi

cmd="${commands[$choice-1]}"

if $execute; then
  eval "$cmd"
else
  echo -n "$cmd" | pbcopy
  echo "Command copied to clipboard."
fi
