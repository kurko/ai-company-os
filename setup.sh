#!/bin/bash
set -euo pipefail

# Installs agents, skills and other files as symlinks into the specified
# directories
#
# - mkdir .claude/agents, .claude/skills, .claude/commands in the destination folder
# - symlinks agents -> to the destination folders
# - renews links if they already exist
#
# This means we can keep editing agents and skills in a single place and benefit
# all associated projects.
#
# Usage: ./setup.sh <destination> [options]
#
# Options:
#   --agent PATTERN    Only install agents matching PATTERN (comma-separated)
#   --skill PATTERN    Only install skills matching PATTERN (comma-separated)
#   --all-agents       Install all agents
#   --all-skills       Install all skills
#
# When no flags are provided, all agents, skills, and commands are installed.
# When any flag is provided, only the specified types are installed.
#
# Examples:
#
#     ./setup.sh ~/my-project/
#     ./setup.sh ~/my-project --agent "role-chief-*"
#     ./setup.sh ~/my-project --skill "utility-*,thinking"
#     ./setup.sh ~/my-project --agent "role-*" --all-skills
#

# Get the directory where this script lives (source of agents/skills)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_usage() {
    echo "Usage: $0 <destination_directory> [options]" >&2
    echo "" >&2
    echo "Options:" >&2
    echo "    --agent PATTERN    Only install agents matching PATTERN (comma-separated)" >&2
    echo "    --skill PATTERN    Only install skills matching PATTERN (comma-separated)" >&2
    echo "    --all-agents       Install all agents" >&2
    echo "    --all-skills       Install all skills" >&2
    echo "" >&2
    echo "When no flags are provided, all agents, skills, and commands are installed." >&2
    echo "When any flag is provided, only the specified types are installed." >&2
    echo "" >&2
    echo "Examples:" >&2
    echo "    $0 ~/my-project/" >&2
    echo "    $0 ~/my-project --agent \"role-chief-*\"" >&2
    echo "    $0 ~/my-project --skill \"utility-*,thinking\"" >&2
    echo "    $0 ~/my-project --agent \"role-*\" --all-skills" >&2
}

# Parse arguments
DEST_DIR=""
AGENT_PATTERN=""
SKILL_PATTERN=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --agent)
            if [[ -z "${2:-}" ]]; then
                echo "Error: --agent requires a pattern argument" >&2
                exit 1
            fi
            AGENT_PATTERN="$2"
            shift 2
            ;;
        --skill)
            if [[ -z "${2:-}" ]]; then
                echo "Error: --skill requires a pattern argument" >&2
                exit 1
            fi
            SKILL_PATTERN="$2"
            shift 2
            ;;
        --all-agents)
            AGENT_PATTERN="*"
            shift
            ;;
        --all-skills)
            SKILL_PATTERN="*"
            shift
            ;;
        -h|--help)
            print_usage
            exit 0
            ;;
        -*)
            echo "Error: Unknown option '$1'" >&2
            print_usage
            exit 1
            ;;
        *)
            if [[ -z "$DEST_DIR" ]]; then
                DEST_DIR="$1"
            else
                echo "Error: Unexpected argument '$1'" >&2
                print_usage
                exit 1
            fi
            shift
            ;;
    esac
done

if [[ -z "$DEST_DIR" ]]; then
    echo "Error: Destination directory is required." >&2
    print_usage
    exit 1
fi

if [[ ! -d "$DEST_DIR" ]]; then
    echo "Error: Destination directory '$DEST_DIR' does not exist." >&2
    exit 1
fi

# Convert to absolute path
DEST_DIR="$(cd "$DEST_DIR" && pwd)"

# Determine install mode: if no flags, install everything
INSTALL_ALL=false
if [[ -z "$AGENT_PATTERN" && -z "$SKILL_PATTERN" ]]; then
    INSTALL_ALL=true
fi

# Check if a filename matches any of the comma-separated patterns
matches_patterns() {
    local filename="$1"
    local patterns="$2"

    if [[ "$patterns" == "*" ]]; then
        return 0
    fi

    IFS=',' read -ra pattern_array <<< "$patterns"
    for pattern in "${pattern_array[@]}"; do
        pattern="${pattern#"${pattern%%[![:space:]]*}"}"  # trim leading
        pattern="${pattern%"${pattern##*[![:space:]]}"}"  # trim trailing
        # shellcheck disable=SC2053
        if [[ "$filename" == $pattern || "$filename" == ${pattern}.md ]]; then
            return 0
        fi
    done
    return 1
}

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

# Link files from a source directory to a destination directory
# Args: source_dir dest_dir dir_name [pattern]
# If pattern is provided, only files matching the pattern are linked
link_directory() {
    local source_dir="$1"
    local dest_dir="$2"
    local dir_name="$3"
    local pattern="${4:-*}"

    if [[ ! -d "$source_dir" ]]; then
        return
    fi

    local linked_count=0
    mkdir -p "$dest_dir"
    echo "Setting up $dir_name..."

    for file in "$source_dir"/*; do
        if [[ -f "$file" ]]; then
            local basename
            basename="$(basename "$file")"
            local name_without_ext="${basename%.md}"

            if matches_patterns "$name_without_ext" "$pattern"; then
                create_symlink "$file" "$dest_dir/$basename"
                linked_count=$((linked_count + 1))
            fi
        fi
    done

    if [[ $linked_count -eq 0 ]]; then
        echo "  (no files matched)"
        rmdir "$dest_dir" 2>/dev/null || true
    fi
}

echo "Installing from: $SCRIPT_DIR"
echo "Installing to:   $DEST_DIR"
echo ""

if [[ "$INSTALL_ALL" == "true" ]]; then
    # No flags: install everything
    link_directory "$SCRIPT_DIR/agents" "$DEST_DIR/.claude/agents" ".claude/agents"
    link_directory "$SCRIPT_DIR/skills" "$DEST_DIR/.claude/skills" ".claude/skills"
    link_directory "$SCRIPT_DIR/commands" "$DEST_DIR/.claude/commands" ".claude/commands"
else
    # Selective install based on flags
    if [[ -n "$AGENT_PATTERN" ]]; then
        link_directory "$SCRIPT_DIR/agents" "$DEST_DIR/.claude/agents" ".claude/agents" "$AGENT_PATTERN"
    fi

    if [[ -n "$SKILL_PATTERN" ]]; then
        link_directory "$SCRIPT_DIR/skills" "$DEST_DIR/.claude/skills" ".claude/skills" "$SKILL_PATTERN"
    fi
fi

echo ""
echo "Done."
