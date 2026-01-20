---
name: "Memory"
description: "Manage working memory and session handoffs. Use at session start/end, when documenting decisions, or recording meetings."
---

# Memory

Manage working memory, meeting notes, and session handoffs.

## When to Use

- At the start of any session (read recap)
- When documenting decisions
- When recording meeting outcomes
- At the end of a session (write recap)
- When updating agent working memory

## Dependencies

- None - this is a core skill

## Book Triggers

Reference: [[books/personal-effectiveness.md]]
- Apply "Getting Things Done" capture principles
- Use clear next actions and waiting-for tracking

---

## Memory Components

### 1. Meeting Notes

**Location:** `projects/{project}/meeting-notes/`
**Filename:** `{date}_{session-id}_{topic}.md`

Record any multi-agent discussion or significant deliberation.

```markdown
# Meeting: [Topic]

**Date:** YYYY-MM-DD
**Session:** sess-NNN
**Participants:** [List of agents/roles]
**Facilitator:** [If applicable]

## Purpose
[Why this meeting occurred]

## Discussion Summary
[Key points discussed]

## Decisions Made
- [Decision 1]
- [Decision 2]

## Action Items
- [ ] [Action] - Owner: [Agent] - Due: [Date if applicable]

## Open Questions
- [Question that wasn't resolved]

## Next Steps
[What happens next]
```

### 2. Agent Working Memory

**Location:** `projects/{project}/agent-memory/{agent-name}.md`
**One file per agent** that participates in the project.

```markdown
# Working Memory: [Agent Name]

**Project:** {project-name}
**Last Updated:** YYYY-MM-DD

## Current Focus
[What this agent is currently working on]

## Recent Decisions
- YYYY-MM-DD: [Decision made] - See: [link to decision doc]
- YYYY-MM-DD: [Another decision]

## Open Questions
- [Question this agent is tracking]
- [Waiting for input on X from Y]

## Context Notes
[Important context this agent needs to remember]

## Handoffs Pending
- [Waiting for X from Agent Y]
- [Need to deliver Z to Agent W]
```

**Rules for working memory:**
- Keep it concise - not a journal
- Tag every entry with project name
- Update at meaningful checkpoints, not constantly
- Clear completed items regularly

### 3. Session Handoff Recaps

**Location:** `projects/{project}/session-recaps/`
**Filename:** `{date}_recap.md`

Like a Monday alignment meeting - generated at end of each session.

```markdown
# Session Recap: YYYY-MM-DD

## Summary
[One paragraph overview of what happened this session]

## Decisions Made
- [Decision 1] - See: [link]
- [Decision 2] - See: [link]

## Work Completed
- [Artifact created/updated]
- [Task completed]

## Questions Raised
- [New question that emerged]
- [Uncertainty to address]

## Current State
[Where the project stands now]

## For Next Session
- [ ] [First priority]
- [ ] [Second priority]
- [ ] [What to read/review first]

## Blockers
- [Anything blocking progress]
```

---

## Session Protocol

### Starting a Session

1. **Read the latest recap**
   ```
   projects/{project}/session-recaps/
   ```
   Find the most recent file and read it.

2. **Check relevant agent memory**
   ```
   projects/{project}/agent-memory/
   ```
   Read working memory for agents that will be active.

3. **Review open decisions**
   ```
   projects/{project}/decisions/
   ```
   Check any pending or recent decisions.

### During a Session

- Document decisions immediately when made
- Update agent working memory at meaningful checkpoints
- Create meeting notes for any multi-agent discussions

### Ending a Session

1. **Write the recap**
   - Summarize decisions, work completed, questions
   - Set up next session's priorities

2. **Update agent working memory**
   - Clear completed items
   - Add new context and open questions

3. **Ensure all decisions are documented**
   - Every decision gets a file in `decisions/`

---

## Decision Documentation

**Location:** `projects/{project}/decisions/` or `company/decisions/`
**Filename:** `{date}_{topic}.md`

See `decision-making.md` for the decision document format.

**When to document:**
- Any choice between meaningful alternatives
- Architectural or technical decisions
- Process or workflow changes
- Strategic direction choices

---

## File Reader Integration

For large files or when managing context window:

Use `utility-file-reader.md` to:
- Read specific sections without full file
- Get summaries with line number references
- Manage token budget across multiple files

---

## Cross-Project Tagging

When working across multiple projects, **always tag entries**:

```markdown
## Recent Decisions
- YYYY-MM-DD [project-alpha]: Decision about X
- YYYY-MM-DD [project-beta]: Decision about Y
```

This enables retrieval when context shifts.

---

## Integration

### Every Agent
- References `memory.md` in their Skills section
- Uses these patterns consistently

### With Facilitator
- `facilitator.md` produces meeting notes using this format
- Facilitated decisions go to `decisions/`

### With Session Management
- Co-founder/orchestrator ensures recaps are written
- Next session always starts with recap read

---

## Anti-Patterns

- **Memory as journal** - Keep it actionable, not narrative
- **Stale working memory** - Clear completed items
- **Missing recaps** - Every session needs a handoff
- **Undocumented decisions** - Decisions evaporate without docs
- **Cross-project confusion** - Always tag with project name
