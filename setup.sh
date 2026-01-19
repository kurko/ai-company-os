#!/bin/bash
set -euo pipefail

# Installs agents, skills and other files as symlinks into the specified
# directories
#
# - mkdir .agents, .skills, .commands in the destination folder
# - symlinks agents -> to the destination folders
# - renews links if they already exist
#
# This means we can keep editing agents and skills in a single place and benefit
# all associated projects.
#
# Usage: ./setup.sh <destination>
#
# Examples:
#
#     ./setup.sh ~/my-project/
#     ./setup.sh ./
#     ./setup.sh ----> ERROR
#

# Get the directory where this script lives (source of agents/skills)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_usage() {
    echo "Usage: $0 <destination_directory>" >&2
    echo "" >&2
    echo "Examples:" >&2
    echo "    $0 ~/my-project/" >&2
    echo "    $0 ./" >&2
}

if [[ $# -ne 1 ]]; then
    echo "Error: Destination directory is required." >&2
    print_usage
    exit 1
fi

DEST_DIR="$1"

if [[ ! -d "$DEST_DIR" ]]; then
    echo "Error: Destination directory '$DEST_DIR' does not exist." >&2
    exit 1
fi

# Convert to absolute path
DEST_DIR="$(cd "$DEST_DIR" && pwd)"

# Create symlink for a single file, removing existing link if present
create_symlink() {
    local source_file="$1"
    local dest_file="$2"

    if [[ -L "$dest_file" ]]; then
        rm "$dest_file"
    elif [[ -e "$dest_file" ]]; then
        echo "Warning: '$dest_file' exists and is not a symlink, skipping." >&2
        return
    fi

    ln -s "$source_file" "$dest_file"
    echo "  Linked: $(basename "$dest_file")"
}

# Link all files from a source directory to a destination directory
link_directory() {
    local source_dir="$1"
    local dest_dir="$2"
    local dir_name="$3"

    if [[ ! -d "$source_dir" ]]; then
        return
    fi

    mkdir -p "$dest_dir"
    echo "Setting up $dir_name..."

    for file in "$source_dir"/*; do
        if [[ -f "$file" ]]; then
            create_symlink "$file" "$dest_dir/$(basename "$file")"
        fi
    done
}

echo "Installing from: $SCRIPT_DIR"
echo "Installing to:   $DEST_DIR"
echo ""

link_directory "$SCRIPT_DIR/agents" "$DEST_DIR/.agents" ".agents"
link_directory "$SCRIPT_DIR/skills" "$DEST_DIR/.skills" ".skills"
link_directory "$SCRIPT_DIR/commands" "$DEST_DIR/.commands" ".commands"

echo ""
echo "Done."
