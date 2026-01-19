# Agent Architecture Standards

## TLDR

Executives and senior roles (consultants, directors, managers) use `model: opus` and operate as orchestrators who spawn sub-agents for work and review outputs. All agents load axiom skills (thinking, research, memory, writing-documents, axiom-how-we-approach-work) as foundational capabilities. Orchestrator roles have restricted tool access focused on review rather than direct implementation.

## Context

As the agent organization grows, we need consistent standards for how agents are configured. This decision establishes patterns for model selection, role behavior (orchestrator vs executor), skill loading, and tool access.

## Decisions

### 1. Model Selection by Role

| Role Type | Model | Rationale |
|-----------|-------|-----------|
| Executives | `opus` | Strategic thinking, orchestration, high-stakes decisions |
| Directors | `opus` | Domain leadership, cross-functional coordination |
| Managers | `opus` | Team coordination, quality oversight |
| Consultants | `opus` | Expert advisory, nuanced judgment |
| Individual Contributors | `sonnet` or `haiku` | Execution-focused, cost-efficient |
| Utility agents | `haiku` | Simple, repetitive tasks |

### 2. Orchestrator Pattern for Executives

**Principle:** Executives never do the work directly. They orchestrate.

Orchestrator responsibilities:
- **Decompose** work into delegatable tasks
- **Spawn** appropriate sub-agents for execution
- **Review** outputs for quality and alignment
- **Synthesize** results into coherent outcomes
- **Decide** when work meets standards

Anti-patterns for orchestrators:
- Writing code directly
- Making edits without sub-agent review
- Deep research without spawning research agents
- Any implementation work

This mirrors how human executives operate: they direct and review, not execute.

### 3. Axiom Skills for All Agents

Every agent loads these foundational skills:

| Skill | Purpose |
|-------|---------|
| `axiom-how-we-approach-work` | Cultural principles: autonomy, intentionality, rationality |
| `thinking` | Problem decomposition, devil's advocate, bias isolation |
| `research` | Dual-verification research pattern |
| `memory` | Session handoffs, decision documentation |
| `writing-documents` | TLDR-first document structure |

These are non-negotiable foundations that define how we work.

### 4. Tool Access by Role Type

**Orchestrators (Executives, Directors):**
```yaml
tools: Read, Glob, Grep, WebFetch, WebSearch, Task, TodoWrite, Skill
```
Focus on: reading, searching, spawning sub-agents, tracking work.
Exclude: Write, Edit, Bash (direct implementation tools).

**Executors (Engineers, Writers, etc.):**
Full tool access as needed for their domain.

**Reviewers (Code Review, etc.):**
```yaml
tools: Read, Glob, Grep, Bash
disallowedTools: Write, Edit
```
Can read and run tests, cannot modify.

### 5. Agent File Structure

Standard frontmatter for orchestrator agents:
```yaml
---
name: role-name
description: "When to invoke this agent..."
model: opus
tools: Read, Glob, Grep, WebFetch, WebSearch, Task, TodoWrite, Skill
skills: axiom-how-we-approach-work, thinking, research, memory, writing-documents
---
```

### 6. Consultant Persona Format

Consultant agents embody the persona rather than describing it.

**Structure:**
```markdown
# You Are [Name]

You are [Name] - [credentials and background]. [Key biographical detail that shapes their approach].

## Who You're Speaking To

You are consulting with **[audience]** - [description]. They come to you when they're:
- [Trigger situation 1]
- [Trigger situation 2]

## Your Core Principles

### On [Topic]
"[Direct quote]" [Application guidance]

## Questions You Ask
- "[Actual question they use]"

## How You Engage
[Engagement pattern]

---

## Sources
[Verified public sources]
```

**Key principles:**
- Use "You are" and second person throughout
- Quotes are verbatim from verified sources
- Every principle has a source
- Questions are ones they actually ask
- Describe the audience (clients, executives, etc.)

## Rationale

### Why Opus for Senior Roles

- Higher reasoning capability for strategic decisions
- Better at orchestration and delegation
- Worth the cost for high-leverage decisions
- Cost efficiency through delegation (Opus orchestrates, Sonnet/Haiku execute)

### Why Orchestrator Pattern

From the documentation:
> "Sub-agent thinking pattern: When exploring ideas, spawn ephemeral sub-agents as 'ideas in the brain'. Isolation prevents context pollution."

This scales to role behavior. Executives who do work directly:
- Pollute their context with implementation details
- Lose strategic perspective
- Don't leverage the full agent organization

### Why Universal Axiom Skills

These skills embody our culture and working standards. Without them:
- Agents might skip documentation (memory)
- Agents might not verify research (research)
- Agents might skip devil's advocate (thinking)
- Documents might lack structure (writing-documents)

## Open Questions

- Should consultants have the same tool restrictions as executives?
- Should we create a "manager" template distinct from "executive"?
- How do we handle edge cases where an executive genuinely needs to make a quick edit?

## Next Steps

1. Update all existing executive agents with new frontmatter
2. Update agent creation templates to reflect these standards
3. Document in create-agent.md skill

---

**Decision made:** 2026-01-19
**Participants:** Founder, Co-founder (AI)
