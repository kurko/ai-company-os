---
name: "Backlog"
description: "Prioritize and organize work into actionable backlog. Use when preparing tasks for execution."
---

# Backlog

Create a prioritized, actionable backlog from user stories.

## When to Use

- After user stories are defined
- When planning sprint/cycle work
- When reprioritizing existing work
- When onboarding to understand pending work

## Dependencies

- **user-stories.md** - User stories must exist
  - Check: Stories defined in PRD or separate document

## Book Triggers

Reference: [[books/systems-thinking.md]]
- Apply "Product Development Flow" queue theory
- Use economic prioritization (Cost of Delay)

Reference: [[books/startup-business.md]]
- Apply "Lean Startup" validated learning
- Use "Rework" simplicity principles

---

## Prioritization Framework

### 1. Stack Ranking

**Every item has exactly one position.** No ties.

Why:
- Forces real decisions
- Eliminates "everything is priority 1"
- Clear execution order

### 2. Cost of Delay (CoD)

Consider what waiting costs:

| CoD Type | Description | Example |
|----------|-------------|---------|
| **User/Business Value** | Revenue, satisfaction impact | Feature customers are asking for |
| **Time Criticality** | Deadline-driven urgency | Regulatory requirement |
| **Risk Reduction** | What failure costs | Security vulnerability |
| **Learning** | Information that enables decisions | MVP to validate market |

### 3. WSJF (Weighted Shortest Job First)

```
Priority = Cost of Delay / Job Duration
```

High CoD + Short Duration = Do first

### 4. Opportunity Cost

For every item in progress:
- What are we NOT doing?
- Is this the best use of capacity?

---

## Backlog Structure

### Item Format

```markdown
### [ID]: [Title]

**Story:** [Link to user story]
**Type:** Feature / Bug / Tech Debt / Spike
**Size:** XS / S / M / L / XL
**Priority:** [Stack rank position]
**Status:** Backlog / Ready / In Progress / Done

**Description:**
[Brief description of the work]

**Acceptance Criteria:**
[Inherited from user story or defined here]

**Dependencies:**
- [Blocks/blocked by]

**Notes:**
[Any additional context]
```

### Backlog Views

**By Priority (Default):**
```
1. [Highest priority item]
2. [Second priority]
3. [Third priority]
...
```

**By Status:**
```
## Ready (can be started)
- [Items ready for work]

## Blocked
- [Items waiting on something]

## In Progress
- [Active work]
```

**By Type:**
```
## Features
## Bugs
## Tech Debt
## Spikes
```

---

## Backlog Refinement Process

### Adding Items

1. **Capture** - Add new items to bottom of backlog
2. **Clarify** - Ensure description and acceptance criteria are clear
3. **Size** - Estimate effort (use story points or t-shirt sizes)
4. **Prioritize** - Stack rank against existing items

### Grooming Sessions

Regular refinement to:
- Break down large items
- Update priorities based on new information
- Remove stale items
- Clarify acceptance criteria

### Ready Definition

Item is "ready" when:
- [ ] Description is clear
- [ ] Acceptance criteria defined
- [ ] Dependencies identified
- [ ] Sized
- [ ] No blocking questions

---

## Backlog Output Template

```markdown
# Backlog: [Project/Feature]

**Last Updated:** YYYY-MM-DD
**Total Items:** [count]
**Ready for Work:** [count]

## Priority Stack

### 1. [Title]
- **Type:** Feature
- **Size:** M
- **Status:** Ready
- **Story:** [link]

### 2. [Title]
- **Type:** Bug
- **Size:** S
- **Status:** Ready
- **Story:** [link]

### 3. [Title]
- **Type:** Feature
- **Size:** L
- **Status:** Blocked (waiting on design)
- **Story:** [link]

---

## Icebox

[Items not currently prioritized but captured for future]

- [Item]: [reason it's iced]
- [Item]: [reason it's iced]

## Recently Completed

- [x] [Item] - YYYY-MM-DD
- [x] [Item] - YYYY-MM-DD
```

---

## Output Location

```
projects/{project}/tasks/backlog.md
```

Or integrated with project management tool via `communication.md` skill.

---

## WIP Limits

Apply Work-in-Progress limits:

| Category | Limit | Rationale |
|----------|-------|-----------|
| In Progress | 1-3 | Focus enables completion |
| Ready | 5-10 | Buffer for planning |
| Backlog | Unlimited | Capture everything |

**When WIP limit reached:**
- Finish something before starting something new
- Swarm on blocked items

---

## Integration

### With user-stories.md
- Stories flow into backlog items
- One story may become multiple backlog items

### With communication.md
- Sync backlog with project management tool
- Updates flow both directions

### With engineering
- Backlog is the source of truth for what to work on
- Engineers pull from top of stack

---

## Quality Checklist

- [ ] All items stack-ranked (no ties)
- [ ] Ready items have clear acceptance criteria
- [ ] Blocked items have blockers documented
- [ ] Sizes assigned to all items
- [ ] No orphan items (all trace to stories/PRD)
- [ ] WIP limits respected

---

## Anti-Patterns

- **Everything is P1** - Stack rank forces real prioritization
- **Huge backlog** - Ruthlessly prune or icebox old items
- **Vague items** - If not ready, it's not ready
- **Starting without finishing** - Respect WIP limits
- **Priority by loudness** - Use CoD, not who's complaining
- **Hidden work** - All work should be in backlog
