# LLMem - The Lightest Memory Management Layer

A tool-independent, universal memory management system using a single bash script. LLMem provides persistent, searchable memory storage for AI agents and assistants—completely independent of any specific tool, platform, or built-in memory system.

## Overview

**LLMem is not about project-specific memory management**—it's a lightweight, general-purpose memory layer that works anywhere. With just bash, `jq`, and a JSON file, you get a complete memory system that:

- **Works with any AI tool or platform** - No vendor lock-in
- **Persists across conversations** - Memories survive beyond individual sessions
- **Portable and transparent** - Simple JSON storage you can inspect and migrate
- **Minimal dependencies** - Runs wherever bash runs

## Tool-Independent Design

Unlike built-in memory systems tied to specific AI platforms, LLMem is completely independent:

- Not bound to any specific AI tool, chatbot, or IDE
- No API calls, cloud services, or proprietary formats
- Works equally well with ChatGPT, Claude, Cursor, local LLMs, or your own scripts
- Simply integrate the bash script into any workflow—it's just standard I/O

This is **universal memory management**, not project-specific state tracking.

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

LLMem is a general-purpose memory layer for any context where you need persistent memory:

- **AI Agent Memory** - Give any AI assistant long-term memory, regardless of the platform
- **Cross-Conversation Context** - Maintain continuity across multiple chat sessions
- **Knowledge Base** - Store and retrieve insights, decisions, and learnings
- **Personal Notes System** - Searchable memory for your own use
- **Multi-Tool Coordination** - Share memory between different AI tools and platforms

Whether you're using ChatGPT, Claude, local LLMs, or custom agents—LLMem works with all of them.

## Dependencies

- `bash`
- `jq` - For JSON manipulation
- `grep` - For searching (standard on Unix systems)

## Agent Integration

See `AGENTS.md` for instructions on integrating this memory system with AI agents/assistants.

