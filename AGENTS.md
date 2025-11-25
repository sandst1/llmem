## Memory Management - CRITICAL REQUIREMENT

**⚠️ IMPORTANT: You MUST use the custom memory management script for all memory operations.**

### Required Tool

Always use this script for memory management:

**`./llmem.sh <command> [arguments]`**

Available commands:

1. **`./llmem.sh save "title" "content"`** - Store new information, insights, decisions, or context
   - Use when: Recording planning decisions, architectural choices, requirements, constraints, or any information that should be remembered
   - Stores memories in `llmem.json` with auto-incrementing IDs and timestamps

2. **`./llmem.sh search "query"`** - Search for relevant memories using grep
   - Use when: Looking for previously stored information, decisions, or context
   - Searches through both title and content fields (case-insensitive)
   - Always search before making decisions to leverage existing knowledge

3. **`./llmem.sh get_all`** - Retrieve all stored memories
   - Use when: You need complete context of all previously recorded information
   - Returns all memories from `llmem.json` in formatted output

### Memory Best Practices

- **Search first**: Always search memories before making planning decisions
- **Store decisions**: Record important architectural choices, trade-offs, and rationales
- **Store constraints**: Save technical, budgetary, or timeline constraints
- **Store insights**: Capture learnings from discussions, research, or analysis
- **Store risks**: Document identified risks and mitigation strategies
- **Store stakeholder input**: Record requirements, preferences, and feedback

### Memory Storage Format

- Memories are stored in `llmem.json` as a JSON array
- Each memory has: `id` (auto-incremented), `title`, and `content`
- Scripts use `jq` for JSON manipulation and `grep` for searching

### DO NOT Use Alternative Memory Tools

- ❌ Do NOT use the built-in `update_memory` tool
- ❌ Do NOT use other memory management approaches
- ✅ ONLY use `./llmem.sh` with the appropriate command
