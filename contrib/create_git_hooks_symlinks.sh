#!/bin/bash

# Get the absolute path to the directory containing this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Define the source and target directories
SOURCE_DIR="$SCRIPT_DIR/git-hooks"
TARGET_DIR="$SCRIPT_DIR/../.git/hooks"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory $SOURCE_DIR does not exist."
    exit 1
fi

# Ensure the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory $TARGET_DIR does not exist. Please ensure you are in the correct directory and that your repository is initialized with Git."
    exit 1
fi

# Create symlinks for each file in the source directory
for hook in "$SOURCE_DIR"/*; do
    # Extract the filename
    hook_name=$(basename "$hook")

    # Create a symlink in the target directory
    ln -sf "$SOURCE_DIR/$hook_name" "$TARGET_DIR/$hook_name"
    echo "Created symlink for $hook_name in $TARGET_DIR"
done

echo "All symlinks created successfully."

