# LLMem - Project-Specific Memory Management

A lightweight demonstration of managing project-specific memories using a single bash script. Designed to help AI agents maintain context across conversations without relying on built-in memory systems.

## Overview

This repository shows how to implement persistent, searchable memory storage with minimal dependencies—just bash, `jq`, and a JSON file.

## Storage Format

Memories are stored in `llmem.json` as a JSON array with the following structure:

```json
[
  {
    "id": 1,
    "title": "Memory title",
    "content": "Detailed memory content",
    "timestamp": "2025-11-25T10:30:00"
  }
]
```

- **id**: Auto-incrementing unique identifier
- **title**: Short descriptive title for the memory
- **content**: Full memory details
- **timestamp**: ISO 8601 timestamp of when the memory was created

## Available Commands

### Save a Memory
```bash
./llmem.sh save "title" "content"
```
Stores a new memory with auto-generated ID and timestamp.

### Search Memories
```bash
./llmem.sh search "query"
```
Case-insensitive search through both title and content fields using `grep`.

### Retrieve All Memories
```bash
./llmem.sh get_all
```
Returns all stored memories in a formatted, readable output.

## Use Cases

- Recording architectural decisions and rationales
- Storing project requirements and constraints
- Tracking insights and learnings
- Documenting risks and mitigation strategies
- Maintaining context for AI-assisted development

## Dependencies

- `bash`
- `jq` - For JSON manipulation
- `grep` - For searching (standard on Unix systems)

## Agent Integration

See `AGENTS.md` for instructions on integrating this memory system with AI agents/assistants.

