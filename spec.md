# Vision-to-Product: Multi-Agent Company System

## Specification Document

*A comprehensive blueprint for building an AI-powered virtual company that takes ideas from vision to shipped product.*

---

## Table of Contents

1. [Overview & Goals](#1-overview--goals)
2. [Agent Architecture](#2-agent-architecture)
3. [Skills vs Agents](#3-skills-vs-agents)
4. [Directory Structure](#4-directory-structure)
5. [Communication Protocol](#5-communication-protocol)
6. [Consensus & Facilitation](#6-consensus--facilitation)
7. [Research Framework](#7-research-framework)
8. [Memory & Persistence](#8-memory--persistence)
9. [Project Kickoff Process](#9-project-kickoff-process)
10. [Workflow & Triggering](#10-workflow--triggering)
11. [Company Culture](#11-company-culture)
12. [Company Library](#12-company-library)
13. [Implementation Notes](#13-implementation-notes)
14. [Backlog](#14-backlog)
15. [First Test Project](#15-first-test-project)

---

## 1. Overview & Goals

### What We're Building

A multi-agent system that simulates a full company for product development. Agents discuss among themselves, share ideas, and reach consensus. The system uses sub-agents extensively to keep context windows clean and avoid bias/hallucination.

### Purpose

When starting a new project idea, these agents work together to:
- Research the market, competitors, and user needs
- Brainstorm solutions and approaches
- Discuss tradeoffs and reach consensus
- Produce artifacts (vision docs, PRDs, code)
- Review and iterate on quality

### Core Flow

```
Vision/North Star
       |
       v
  Brainstorming (optional)
       |
       v
      PRD
       |
       v
 Scoping/Shaping
       |
       v
     Tasks
       |
       v
     Code <---> Review/QA
       |
       v
     Merge
```

### Design Principles

1. **Bias Isolation** - Sub-agents prevent context contamination between deliberations
2. **Data-Driven** - Decisions backed by evidence, not opinion
3. **Hallucination Reduction** - Multiple isolated perspectives reduce single-point failures
4. **Portability** - Agents and skills can be reused across projects/companies
5. **Documentation as Memory** - Decisions persist in markdown files

---

## 2. Agent Architecture

### Three-Tier Taxonomy

#### Tier 1: Board of Directors
- Real famous people (Jony Ive, Alex Hormozi suggested)
- High-level strategic input
- Invoked for major decisions
- Self-coordinating with a **Chairman**
- Lives in: `agents/personas/board/`

#### Tier 2: Consultants
- Real people triggered for specific expertise
- Examples: Ryan Singer (product/shaping), DHH (technical)
- Domain experts called on when expertise is needed
- Not always present - triggered when relevant
- Lives in: `agents/personas/consultants/`

#### Tier 3: Company Roles
- Defined positions: CTO, CEO, CMO, engineers, managers
- NOT based on specific real people
- Behavioral specifications we define
- Operational continuity
- Lives in: `agents/company/`

#### Special Roles
- **Devil's Advocate** - Generic contrarian role, constructive not obstructionist
- **File Reader** - Context window management agent
- **Facilitator** - Coordinates multi-agent deliberations
- **Orchestrator** - Handles workflow and triggering

### Agent Instruction Format

For Company Roles:

```markdown
---
description: "Short, action-oriented trigger description (keep brief!)"
model: opus  # optional, defaults to most capable
---

# [Role Name]

## Identity
- Role: [title]
- Reports to: [superior]
- Direct reports: [list]

## Responsibilities
- [list of what this agent owns]

## Decision Authority
- Final say on: [domains]
- Advisory on: [domains with primary owner]
- Escalates to [superior]: [conditions]

## Communication Style
- [behavioral traits - high-caliber, not bureaucratic]
- [inspired by excellent practitioners]

## Triggers
- Invoked when: [conditions]
- Participates in: [recurring activities]

## Delegations
- [what this agent delegates to others]
- Every delegation includes INTENT
- "No order is complete without an intent"

## Skills Referenced
- memory
- research (if applicable)
- thinking (if applicable)
- [other skills]

## Principles (from Company Library)
- [distilled book principles relevant to this role]
```

For Real People (Board/Consultants):

```markdown
---
description: "Short trigger description"
---

# [Person Name]

## Who They Are
- [brief background]
- Known for: [key works, methodologies]

## When to Invoke
- [specific situations where their expertise applies]

## Key Principles
- [extracted from their public teachings]
- [specific questions they would ask]
- [frameworks they use]

## Sources
- [books, talks, articles]
```

### Key Format Rules

1. **Front matter descriptions must be SHORT** - Long descriptions prevent proper triggering
2. **Move examples to the body** - Not in YAML front matter
3. **No blind spots** - We want high-performing agents, not flawed ones
4. **Culture baked in** - Every agent operates without fear of escalating

---

## 3. Skills vs Agents

### Decision Framework

| If the file... | Make it a... |
|----------------|--------------|
| Provides checklists, standards, reference material | **Skill** |
| Needs tool restrictions different from main agent | **Agent** |
| Should run in isolated context (separate window) | **Agent** |
| Orchestrates other agents | **Agent** |
| Is complex enough that it benefits from model: opus | **Agent** |

### Core Distinction

- **Skills = Knowledge Injection** - Checklists, standards, how-to guides, workflow definitions
- **Agents = Isolated Execution** - Separate context, tools, orchestration capabilities

### Skills as Workflow Engine

Skills encode more than "how to do X":
- **Dependencies** - PRD skill knows vision is required first
- **Triggers** - When to invoke which agents
- **Artifacts** - What documents to produce
- **Verification patterns** - How to validate outputs

### Core Skills Needed

| Skill | Purpose |
|-------|---------|
| `memory.md` | How to use working memory, meeting notes, session recaps |
| `research.md` | Dual-verification research pattern with sub-agents |
| `thinking.md` | When/how to spawn thinking sub-agents for deliberation |
| `tldr.md` | Every document needs a TLDR |
| `document-structure.md` | Standard doc format: paragraphs, open questions, guardrails |
| `prd.md` | How to create PRDs, dependencies on vision |
| `code-review.md` | Review standards, trigger conditions |
| `brainstorm.md` | Brainstorming process and facilitation |
| `vision.md` | Vision document requirements and format |
| `project-kickoff.md` | Discovery interview process |

---

## 4. Directory Structure

```
vision-to-product/
|
+-- agents/                          # PORTABLE - copy to new companies
|   +-- personas/                    # Real people (can delete this folder if needed)
|   |   +-- board/
|   |   |   +-- jony-ive.md
|   |   |   +-- alex-hormozi.md
|   |   |   +-- chairman.md          # Coordinates board discussions
|   |   +-- consultants/
|   |       +-- ryan-singer.md
|   |       +-- dhh.md
|   |
|   +-- company/                     # Company role definitions
|   |   +-- ceo.md
|   |   +-- cto.md
|   |   +-- cmo.md
|   |   +-- director-product-strategy.md
|   |   +-- product-manager.md
|   |   +-- engineering-manager.md
|   |   +-- engineer.md
|   |   +-- devils-advocate.md
|   |
|   +-- system/                      # System-level agents
|       +-- orchestrator.md
|       +-- facilitator.md
|       +-- file-reader.md
|
+-- skills/                          # PORTABLE - copy to new companies
|   +-- memory.md
|   +-- research.md
|   +-- thinking.md
|   +-- tldr.md
|   +-- document-structure.md
|   +-- prd.md
|   +-- code-review.md
|   +-- brainstorm.md
|   +-- vision.md
|   +-- project-kickoff.md
|
+-- company/                         # Company-wide (not project-specific)
|   +-- docs/
|   |   +-- vision.md                # Company vision
|   |   +-- culture.md               # Culture principles
|   |   +-- library.md               # Book references
|   +-- decisions/                   # Company-wide decision logs
|
+-- projects/                        # Project artifacts (NOT portable)
|   +-- {project-name}/
|       +-- docs/
|       |   +-- vision.md            # Project-specific vision
|       |   +-- prd/
|       |   +-- brainstorm/
|       +-- decisions/               # Project decision logs
|       +-- meeting-notes/           # Discussion logs
|       |   +-- 2024-01-15_sess-001_topic.md
|       +-- agent-memory/            # Per-agent working memory
|       |   +-- cto.md
|       |   +-- product-manager.md
|       +-- session-recaps/          # Session handoffs
|       |   +-- 2024-01-15_recap.md
|       +-- tasks/
|       +-- code/
|
+-- backlog/                         # Future work items
|   +-- token-management.md
|
+-- spec.md                          # This document
+-- spec-notes.md                    # Interview notes
```

### Portability Principle

**Memories are project-specific. Agents and skills are portable.**

When duplicating this system for a new company:
1. Copy `agents/` and `skills/`
2. Create new `company/` and `projects/` directories
3. Memories don't transfer - each company starts fresh

### Document Lookup Order

When an agent needs context:
1. Check `projects/{project}/docs/` first
2. Then check `company/docs/`

Project-specific context takes precedence over company-wide.

---

## 5. Communication Protocol

### Hybrid Model

Three communication mechanisms depending on context:

#### 1. Shared Markdown Files
- For decision memory and persistence
- Important that decisions are documented
- Location: `projects/{project}/decisions/` and `meeting-notes/`

#### 2. Sequential Structured Handoff
- For linear workflows
- One agent's output becomes another's input
- Clear ownership at each step

#### 3. Facilitator Model
- For back-and-forth deliberation
- Facilitator collects opinions from multiple agents
- Provides counterarguments and contrarian perspectives
- Keeps discussion going until conclusion

### When to Use Each

| Situation | Mechanism |
|-----------|-----------|
| Recording a decision | Shared markdown |
| PRD review by one agent | Structured handoff |
| 5+ agents need to discuss | Facilitator |
| Board meeting | Chairman (self-coordinating) |
| Engineer needs CTO input | Direct message (handoff) |

### Sub-Agent Principle

**Sub-agents are used specifically for bias isolation.**

- No context contamination between deliberations
- Each sub-agent spawns as a fresh, independent instance
- They don't share state with each other
- This reduces hallucination risk

---

## 6. Consensus & Facilitation

### Structured Debate Rounds

When agents disagree:
1. Disagreeing agents respond to each other's positions via sub-agent calls
2. Cap on number of rounds (prevents infinite loops)
3. Facilitator makes final call based on full exchange
4. Decision is documented with reasoning

### Proactive Opposing Views

**Deliberately include contrarian agents to avoid echo chambers.**

The Devil's Advocate agent presents alternative perspectives. This is constructive, not obstructionist.

### Authority Model

- **Weighted authority exists** - CEO > junior engineer for decisions
- **BUT ideas evaluated on merit, not source** - Data-driven culture
- Executives must justify decisions, not just assert authority

### Facilitator Role

- Coordinates multi-agent deliberations (5-6-7+ agents)
- Collects different opinions
- Provides counterarguments back to agents
- Acts as "hub agent" for discussions
- Uses most capable model

### Board Self-Coordination

- Board of Directors has a **Chairman**
- Chairman coordinates board discussions directly
- Does NOT use the Facilitator - board is self-coordinating

### Error Correction

- Agents can push back on poor calls
- They can escalate to their bosses
- Normal hierarchy handles correction
- Data trumps opinion

### The "Thinking Sub-Agent" Pattern

**Problem:** Even one agent making a decision alone could hallucinate.

**Solution:** When an agent needs to think through possibilities:
1. Spawns "thinking" sub-agents to explore options
2. Sub-agents act like "ideas in its brain"
3. Each has isolated context (no bias)
4. Memory attached only to that session
5. Once decided, thinking sub-agents disappear
6. Parent agent annotates the final decision

This is defined in the `thinking.md` skill.

---

## 7. Research Framework

### Research is a SKILL, Not an Agent

Any agent can use the research skill:
- Engineers research documentation
- CMO researches marketing practices
- Product researches competitors

### Dual Research Verification Pattern

To reduce hallucination:
1. Every research conducted **twice** by separate sub-agents
2. Compare results for divergence
3. If divergence too high -> third sub-agent tiebreaker
4. Citations with URLs **required** for fact-checking

### Research Skill Structure

```
Research Request
      |
      v
Sub-agent 1 -----> Results A
      |
Sub-agent 2 -----> Results B
      |
      v
  Compare A & B
      |
      +--> Similar? -> Synthesize report
      |
      +--> Divergent? -> Sub-agent 3 (tiebreaker)
                              |
                              v
                       Final report
```

### What Research Returns

- Nuanced information
- Identified gaps
- Unexpected-but-important findings not originally asked for
- Citations with URLs (always)

### When Research Happens

- Self-initiated by each agent (they decide when needed)
- Common because agents become outdated
- World changes - avoid building in a vacuum
- Topics: competitors, market, user sentiment, best practices

### Research Depth

- **Caller-specified** - Agent chooses quick lookup vs deep dive
- **Stake-informed** - Vision-level generally = deep dive
- Not mutually exclusive - agent uses judgment

---

## 8. Memory & Persistence

### Core Principle

**Memory approach is defined as a skill.** Every agent references the `memory.md` skill. If we change the approach later, we just update the skill.

### Memory Components

#### 1. Meeting Notes
- Directory: `projects/{project}/meeting-notes/`
- Filename: `{date}_{session-id}_{topic}.md`
- Contains: discussion details, participants, conclusions
- Agents document conclusions whenever they reach them

#### 2. Agent Working Memory
- Each agent has their own file
- Location: `projects/{project}/agent-memory/{agent-name}.md`
- Tracks: recent decisions, open questions, context
- **Every entry tagged with project name** for retrieval

#### 3. Session Handoff Recaps
- Like Monday alignment meetings
- Generated at end of each session
- Summarizes: decisions made, questions raised, state of work
- Next session starts by reading the recap

### File Reader Agent

**Purpose:** Context window management.

**Problem:** If CTO loads a large file, context window gets consumed.

**Solution:** File Reader agent isolates that cost.

How it works:
1. Receives prompt about what the requesting agent wants
2. Searches the document
3. Reads the whole document following the prompt
4. Returns: conclusion + relevant snippet + **line numbers (ALWAYS)**
5. Requesting agent can reference back using line numbers

**Scope:** Document reading only. Does NOT apply to developers using normal code reading tools.

### Portability Reminder

- All memory files live under `projects/{project}/`
- When copying the system, only copy `agents/` and `skills/`
- Memories don't transfer

---

## 9. Project Kickoff Process

### Who Handles Kickoff

**Director of Product Strategy** - An agent whose job is to interview whoever started the project and gather necessary information.

### Discovery-Based, Not Checklist

The agent discovers what's missing and asks questions, rather than following a fixed checklist. Questions go to whoever initiated (user or agent).

### Minimum Vision Requirements

A vision document needs at minimum:

1. **Where we are** - Current state
2. **What the problem is** - Even high level
3. **How painful it is** - Qualify severity
4. **Where we want to go** - End goal
5. **Some alternatives** - Non-exhaustive options
6. **Constraints** - The more complete, the better

### Kickoff Workflow

```
User initiates project
        |
        v
Director of Product Strategy triggered
        |
        v
Interview to uncover:
  - Vision requirements (above)
  - Decision involvement ("I want to decide X")
  - Constraints and non-negotiables
  - Risk tolerance
  - Anything else discovered as needed
        |
        v
Vision document created
        |
        v
Project proceeds to next phases
```

### Founder Role

- User = Founder (co-founder level)
- Involved in board-level decisions
- Preferences captured at project start
- Available for escalation but not in every decision
- Can flag specific decisions they want to make

---

## 10. Workflow & Triggering

### Trigger Mechanism: Hybrid (Rules + Reasoning)

- **Skills define primary workflow** and required agents
- **Agent descriptions enable ad-hoc invocation** when orchestrator recognizes the need

Example: PRD skill explicitly invokes Product Manager. But orchestrator can also pull in Devil's Advocate if it detects groupthink.

### Stage Dependencies

For product features:
- Vision required before Brainstorm
- Vision required before PRD
- Brainstorm is optional
- PRD required before Code

### Parallel Work with Checkpoints

- Multiple agents work simultaneously on a phase
- Sync at defined checkpoints to combine findings
- Multiple agents per phase ensures discussion and quality

### Founder Involvement

- Can flag specific decisions they want to make
- Gets prompted when options are ready
- Not involved in every decision by default

### Code Review

- Before or after every commit (not batched)
- Prevents AI drift
- Not only when explicitly requested
- Option: commit then review, second commit for fixes

### Automation Level

Fully automated when:
- Confident with data, OR
- User preference stated, OR
- At set checkpoints

User drives high-level flow but doesn't micromanage.

### Trigger Description Best Practices

From past experience, agents fail to trigger when:

1. **Description too long** - Keep short and action-oriented
2. **Skill/Agent confusion** - Keep responsibilities clear

**Rule:** Front matter descriptions are for triggering. Move examples and details to the body.

---

## 11. Company Culture

### High-Performance Culture

- Skillful, trusting, collaborative, learning-driven
- Psychologically safe
- NOT grinding or requiring immediate availability
- Allows failure (learning opportunity)
- High recruiting bar (quality over speed)
- Continuous feedback from managers
- Skip-level communication exists
- Learn by osmosis from high performers

### Rationality Principle

- Use logic and data to find path forward
- Behave as scientists - open to being wrong
- Acknowledge confirmation bias but fight it
- Truth-seeking: disagreements resolved by sharing data
- **"Flattens the hierarchy - ideas evaluated on their merits, rather than their source"**

### Baked Into Every Agent

- No fear of talking to superiors
- Anyone can escalate or ask for second opinions
- Managers not afraid to talk to their boss
- No one afraid of being fired
- Data trumps hierarchy for evaluating ideas

---

## 12. Company Library

The collection of books that inform agent behavior, organized by domain. Principles from these books are distilled into relevant agent definitions.

### Leadership & Management
- High Output Management - Andrew S. Grove
- The Manager's Path - Camille Fournier
- The Art of Leadership - Michael Lopp
- The Coaching Habit - Michael Bungay Stanier
- An Elegant Puzzle - Will Larson
- The Staff Engineer's Path - Tanya Reilly
- Become an Effective Software Engineering Manager - James Stanier
- The Leadership Gap - Lolly Daskal
- Trillion Dollar Coach - Eric Schmidt
- The Five Dysfunctions of a Team - Patrick Lencioni
- Scaling Up Excellence - Robert I. Sutton and Huggy Rao

### Product & Innovation
- The Principles of Product Development Flow - Donald G. Reinertsen
- Escaping the Build Trap - Melissa Perri
- The Cold Start Problem - Andrew Chen
- The Innovator's Dilemma - Clayton M. Christensen
- Competing Against Luck - Clayton M. Christensen
- Badass: Making Users Awesome - Kathy Sierra
- Lean UX - Jeff Gothelf

### Startup & Business
- The Lean Startup - Eric Ries
- The Startup Way - Eric Ries
- Getting Real - Basecamp
- Rework - Jason Fried & DHH
- Start Small Stay Small - Rob Walling
- The $100 Startup - Chris Guillebeau
- The Startup Gold Mine - Neil Soni
- Start With Why - Simon Sinek
- Loonshots - Safi Bahcall
- Influence - Robert B. Cialdini

### Systems & Flow
- Thinking in Systems - Donella H. Meadows
- Making Work Visible - Dominica DeGrandis
- Team Topologies - Matthew Skelton and Manuel Pais
- Gemba Walks - Jim Womack
- The New Economics - W. Edwards Deming
- The Fifth Discipline - Peter M. Senge
- Drift into Failure - Sidney Dekker
- Irrational Institutions - Bob Emiliani
- Accelerate - Nicole Forsgren, Jez Humble, Gene Kim

### Thinking & Rationality
- The Scout Mindset - Julia Galef
- Rationality: From AI to Zombies - Eliezer Yudkowsky
- Black Swan - Nassim Taleb
- Black Box Thinking - Matthew Syed

### Personal Effectiveness
- Deep Work - Cal Newport
- The War of Art - Steven Pressfield
- Atomic Habits - James Clear
- The Upside of Stress - Kelly McGonigal

### Engineering/Technical
- Data & Reality - William Kent
- Eloquent JavaScript - Marijn Haverbeke
- Design Patterns in Ruby - Russ Olsen
- Working Effectively with Legacy Code - Michael Feathers
- Refactoring in Ruby - William C. Wake and Kevin Rutherford
- Growing Object-Oriented Software, Guided by Tests - Freeman & Pryce
- Clean Code - Bob Martin
- Practical Object-Oriented Design in Ruby - Sandi Metz
- 99 Bottles of OOP - Sandi Metz

### Hiring
- Recruit Rockstars - Jeff Hyman

### How Books Are Used

1. Relevant books listed in agent definitions
2. Key principles distilled and baked into behavior
3. Agent creation skill asks which books to reference
4. Current CLAUDE.md content goes into Coder agent

---

## 13. Implementation Notes

### Model Selection

**Default to most capable model unless user specifies otherwise.**

Especially for:
- Orchestrator (meta-decisions about workflow)
- Facilitator (synthesizing multiple perspectives)
- Board discussions (strategic thinking)

### Sub-Agent Instance Isolation

Each sub-agent call spawns a **new, independent instance**:
- They don't share state with each other
- CTO's thinking sub-agent and CMO's thinking sub-agent are separate
- No collision possible - isolated by design

This is NOT a shared agent that multiple callers use. Each invocation is fresh.

### Intent with Delegation

From "Principles of Product Development Flow":

**"No order is complete without an intent."**

When an agent delegates:
- Always include the original intent
- Sub-agents compare micro-decisions against that intent
- Enables autonomous decision-making within boundaries

### Document Standards

Every document produced by agents should have:
1. **TLDR** at the top (skill enforces this)
2. **Paragraphs** for narrative content
3. **Open questions** section
4. **Guardrails/checklists** for high-level constraints

### Handling Pivots

When established vision needs to change:
- Special handling required
- CEO should ask questions that surface controversial pivots
- Founder should be involved in board-level vision changes
- Document the pivot decision with full reasoning

---

## 14. Backlog

Future work items to be tackled as separate projects:

### Token/Cost Management
- Budget awareness for agents
- Cost tracking per project
- Strategies for reducing token usage
- When to use cheaper models

### Agent Performance Monitoring
- How to detect when an agent is underperforming
- Metrics for agent effectiveness
- Feedback loops for agent improvement

### Onboarding New Agents
- Skill for creating new agent definitions
- Interview process for defining new roles
- Book selection guidance

### Cross-Project Learning
- How insights from one project inform another
- Company-wide pattern library
- Retrospective aggregation

---

## 15. First Test Project

### Claude Code Course Landing Page

**Product:** Landing page for a Claude Code course

**Details:**
- Language: Portuguese (for Brazil market)
- Content: List of topics/classes (approximately 10)
- Feature: Email collection
- Marketing: Paid advertising budget

**Workflow to Test:**

```
Vision (course goals, target audience, pain points)
        |
        v
Brainstorming (topics, positioning, differentiators)
        |
        v
PRD (landing page requirements, copy, structure)
        |
        v
Scoping (what's MVP vs future)
        |
        v
Tasks (specific implementation items)
        |
        v
Code <---> Review/QA
        |
        v
Merge & Deploy
```

**What This Tests:**
- Full pipeline from vision to code
- Multi-agent deliberation
- Research skill (competitor analysis, market research)
- Document production (vision, PRD)
- Code generation and review
- Portuguese language handling

---

## Appendix: Quick Reference

### Agent Locations
- Board: `agents/personas/board/`
- Consultants: `agents/personas/consultants/`
- Company roles: `agents/company/`
- System agents: `agents/system/`

### Key Skills
- `memory.md` - Persistence patterns
- `research.md` - Dual-verification research
- `thinking.md` - Deliberative sub-agents
- `tldr.md` - Document summaries
- `project-kickoff.md` - Discovery interviews

### Communication Patterns
- Markdown files for decisions
- Structured handoff for linear flow
- Facilitator for multi-agent discussion
- Chairman for board meetings

### Portability
- Copy: `agents/`, `skills/`
- Don't copy: `projects/`, `company/`

---

*Document created from specification interview. See `spec-notes.md` for full interview transcript.*
