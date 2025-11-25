#!/bin/bash

# Unified memory management script
# Usage: ./llmem.sh <command> [arguments]
#
# Commands:
#   save <title> <content>  - Save a new memory
#   get_all                 - Retrieve all memories
#   search <query>          - Search memories by query

MEMORY_FILE="llmem.json"
COMMAND="$1"

# Function to display usage
usage() {
    echo "Usage: $0 <command> [arguments]"
    echo ""
    echo "Commands:"
    echo "  save <title> <content>  - Save a new memory"
    echo "  get_all                 - Retrieve all memories"
    echo "  search <query>          - Search memories by query"
    exit 1
}

# Function to save a memory
save_memory() {
    TITLE="$1"
    CONTENT="$2"
    
    if [ -z "$TITLE" ] || [ -z "$CONTENT" ]; then
        echo "Usage: $0 save \"title\" \"content\""
        exit 1
    fi
    
    # Initialize llmem.json if it doesn't exist
    if [ ! -f "$MEMORY_FILE" ]; then
        echo "[]" > "$MEMORY_FILE"
    fi
    
    # Get the next ID
    NEXT_ID=$(jq 'map(.id) | max // 0 | . + 1' "$MEMORY_FILE")
    
    # Get current timestamp in ISO 8601 format
    TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%S")
    
    # Create new memory entry
    NEW_MEMORY=$(jq -n \
        --arg id "$NEXT_ID" \
        --arg title "$TITLE" \
        --arg content "$CONTENT" \
        --arg timestamp "$TIMESTAMP" \
        '{id: ($id | tonumber), title: $title, content: $content, timestamp: $timestamp}')
    
    # Add to llmem.json
    jq --argjson new "$NEW_MEMORY" '. += [$new]' "$MEMORY_FILE" > "${MEMORY_FILE}.tmp" && mv "${MEMORY_FILE}.tmp" "$MEMORY_FILE"
    
    echo "Memory saved with ID: $NEXT_ID"
}

# Function to get all memories
get_all_memories() {
    if [ ! -f "$MEMORY_FILE" ]; then
        echo "No memories found. Memory file does not exist."
        exit 0
    fi
    
    # Format and display all memories
    jq -r '.[] | "ID: \(.id)\nTitle: \(.title)\nContent: \(.content)\n---"' "$MEMORY_FILE"
}

# Function to search memories
search_memories() {
    QUERY="$1"
    
    if [ -z "$QUERY" ]; then
        echo "Usage: $0 search \"query\""
        exit 1
    fi
    
    if [ ! -f "$MEMORY_FILE" ]; then
        echo "No memories found. Memory file does not exist."
        exit 0
    fi
    
    # Search through title and content using jq and grep
    jq -r '.[] | "ID: \(.id)\nTitle: \(.title)\nContent: \(.content)\n---"' "$MEMORY_FILE" | \
        grep -B 3 -A 1 -i "$QUERY" | \
        sed '/^--$/d'
}

# Main command dispatcher
case "$COMMAND" in
    save)
        save_memory "$2" "$3"
        ;;
    get_all)
        get_all_memories
        ;;
    search)
        search_memories "$2"
        ;;
    *)
        usage
        ;;
esac

