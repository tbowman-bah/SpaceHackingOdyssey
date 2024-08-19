#!/bin/bash
set -ev

# Loop through all files in the current directory
for file in *; do
  # Replace spaces with underscores and remove backticks, single quotes, and double quotes
  if [[ "$file" == *" "* || "$file" == *\`* || "$file" == *\'* || "$file" == *\"* ]]; then
    # Replace spaces with underscores
    new_file=$(echo "$file" | sed 's/ /_/g')
    # Rename the file
    mv "$file" "$new_file"
  fi
done
