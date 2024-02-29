#!/bin/bash

# Define the directory where you want to store your ABIs
TARGET_ABI_DIR="packaged_abis"

# Define the root directory for compiled ABIs
COMPILED_ABI_ROOT="out"

# Clear the TARGET_ABI_DIR, leaving only the .gitkeep file
find "$TARGET_ABI_DIR" -type f ! -name '.gitkeep' -delete

# Find all .sol files recursively in the src directory and loop through them
find src/ -type f -name '*.sol' | while read -r contract; do
  # Extract contract name and path
  contract_name=$(basename "$contract")
  name_no_ext=$(basename "$contract" .sol)

  # Check if the ABI file exists, then copy it
  abi_path="$COMPILED_ABI_ROOT/$contract_name/$name_no_ext.json"
  if [ -f "$abi_path" ]; then
    cp -f "$abi_path" "$TARGET_ABI_DIR/"
  fi
done

