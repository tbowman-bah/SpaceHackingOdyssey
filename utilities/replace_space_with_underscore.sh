#!/usr/bin/env bash
set -e

# Loop through all files in the current directory
for file in *; do
  # Check if the file name contains spaces, backticks, single quotes, or double quotes
  if [[ "$file" == *" "* || "$file" == *\`* || "$file" == *\'* || "$file" == *\"* ]]; then
    # Replace spaces with underscores and remove backticks, single quotes, and double quotes
    new_file=$(echo "$file" | sed 's/ /_/g; s/[\`\'\"]//g')
    # Rename the file
    if mv "$file" "$new_file"; then
      echo "Renamed '$file' to '$new_file'"
    else
      echo "Failed to rename '$file'" >&2
    fi
  fi
done

