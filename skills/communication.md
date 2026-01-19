---
name: "Communication"
description: "Interact with project management tools (Linear, Asana, Jira). Use when creating tasks or syncing status."
---

# Communication

Abstract interface for project management tools.

## When to Use

- Creating tasks in external system
- Updating task status
- Syncing backlog with project management tool
- Reading task information

## Dependencies

- None - this is a utility skill

---

## Core Principle

**One skill, multiple backends.**

This skill abstracts the specific project management tool. Change tools by updating this skill, not all agents.

---

## Supported Backends

| Tool | When Used | Configuration |
|------|-----------|---------------|
| **Markdown** | Default, local files | `projects/{project}/tasks/` |
| **Linear** | When Linear MCP available | Via MCP integration |
| **Asana** | When Asana MCP available | Via MCP integration |
| **Jira** | When Jira MCP available | Via MCP integration |

---

## Task Operations

### Create Task

```markdown
## Create Task

**Title:** [Task title]
**Description:** [Task description]
**Type:** Feature / Bug / Task / Story
**Priority:** High / Medium / Low
**Assignee:** [Agent or person]
**Labels:** [Relevant labels]
**Parent:** [Epic or project if applicable]
```

### Update Task

```markdown
## Update Task

**Task ID:** [ID or link]
**Field:** [What to update]
**New Value:** [Updated value]
```

### Read Task

```markdown
## Read Task

**Task ID:** [ID or link]

Returns:
- Current status
- Description
- Comments
- History
```

### List Tasks

```markdown
## List Tasks

**Filter:** [Status, assignee, label, etc.]
**Sort:** [Priority, date, etc.]
**Limit:** [Number of results]
```

---

## Markdown Backend (Default)

When no external tool is configured, use markdown files.

### File Structure

```
projects/{project}/tasks/
├── backlog.md
├── in-progress/
│   └── task-001.md
├── done/
│   └── task-002.md
└── archive/
```

### Task File Format

```markdown
# [Task Title]

**ID:** TASK-001
**Status:** Backlog / In Progress / Done
**Type:** Feature / Bug / Task
**Priority:** High / Medium / Low
**Created:** YYYY-MM-DD
**Updated:** YYYY-MM-DD

## Description

[Task description]

## Acceptance Criteria

- [ ] [Criterion 1]
- [ ] [Criterion 2]

## Notes

[Any additional context]

## History

- YYYY-MM-DD: Created
- YYYY-MM-DD: Status changed to In Progress
```

---

## Linear Backend

When Linear MCP is available:

### Create Issue
```
Use Linear MCP: createIssue
- title: [title]
- description: [description]
- teamId: [team]
- priority: [0-4]
- labelIds: [labels]
```

### Update Issue
```
Use Linear MCP: updateIssue
- issueId: [id]
- [field]: [value]
```

### Query Issues
```
Use Linear MCP: searchIssues
- query: [search query]
- filter: [filter object]
```

---

## Status Sync Protocol

### From Backlog to Tool

When `backlog.md` is updated:
1. Identify new/changed items
2. Sync to external tool
3. Update backlog with external IDs

### From Tool to Backlog

When external tool changes:
1. Query for recent changes
2. Update local backlog.md
3. Note sync timestamp

---

## Integration

### With backlog.md
- Backlog is source of truth for priorities
- Communication syncs with external tools

### With agents
- Agents request task operations
- Communication handles the backend

---

## Status Mapping

| Internal Status | Linear | Asana | Jira |
|-----------------|--------|-------|------|
| Backlog | Backlog | Not Started | To Do |
| Ready | Todo | Upcoming | Ready |
| In Progress | In Progress | In Progress | In Progress |
| Review | In Review | In Review | In Review |
| Done | Done | Completed | Done |

---

## Quality Checklist

- [ ] Task has clear title
- [ ] Description includes context
- [ ] Acceptance criteria defined
- [ ] Priority assigned
- [ ] Linked to parent (if applicable)

---

## Anti-Patterns

- **Duplicate systems** - One source of truth
- **Stale sync** - Keep systems aligned
- **Missing context** - Tasks need enough detail
- **Tool-specific logic** - Keep backends interchangeable
