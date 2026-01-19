# Vision-to-Product: Specification Interview Notes

*Running notes from specification interview - last updated during session*

---

## 1. Core Vision

**What we're building:** A multi-agent system that simulates a full company for product development. Agents discuss among themselves, share ideas, and reach consensus. Heavy use of sub-agents to keep context windows clean and avoid bias/hallucination.

**Purpose:** When starting a new project idea, these agents work together to research, brainstorm, discuss, and reach consensus on product decisions.

**Proposed flow:** Vision/North Star → Brainstorming → PRD → Scoping/Shaping → Tasks → Code (with Review/QA/Merge cycle)

---

## 2. Agent Communication Model

**Decision: Hybrid approach**

Three communication mechanisms depending on context:

1. **Shared markdown files** - For decision memory/persistence. Important that decisions are documented and memorable.

2. **Sequential structured handoff** - For linear workflows where one agent's output becomes another's input.

3. **Council president model** - For back-and-forth deliberation. Gets outputs from agents, asks questions back, returns decisions to main orchestrator.

**Key principle:** Sub-agents are used specifically for bias isolation - no context contamination between deliberations. This reduces hallucination risk.

---

## 3. Consensus & Disagreement

**Decision: Structured debate rounds (with nuances)**

- Disagreeing agents respond to each other's positions via sub-agent calls (prevents context bleed)
- Cap on number of rounds
- Council president makes final call based on full exchange
- **Proactive opposing views** - Deliberately include contrarian agents to avoid echo chambers

**Authority model:**
- Weighted authority exists (CEO > junior engineer for decisions)
- BUT ideas evaluated on merit, not source (data-driven culture)
- Executives shouldn't be "bureaucrats" - must justify decisions

**User's role:**
- User = Founder (co-founder level)
- Involved in board-level decisions
- Preferences captured at project start
- Available for escalation but not involved in every decision

**Special case - Pivots:**
- When established vision needs to change, special handling required
- CEO should ask questions that surface when pivots might be controversial

---

## 4. Handling Challenges to Established Decisions

**Decision: Combined approach (options 3+4)**

1. **Assumptions auditor** - Dedicated function that periodically reviews established decisions against new information

2. **Uncertainty/confidence tracking** - Decisions get confidence levels, low-confidence decisions revisited

**Escalation model (bottom-up communication):**
- Engineers talk to managers
- Managers document contradictions in their own briefs
- Regular business bubbles up through hierarchy
- Executives can ping founder directly
- Very confident managers can also reach founder directly
- Skip-level communication exists (per culture doc)

**Core principle: Data-driven**
- Even with hierarchy, data guides decisions
- If data contradicts vision, people should feel confident escalating
- Truth-seeking culture: disagreements resolved by sharing data
- Behave as scientists - open to being wrong, update with evidence

---

## 5. Research Layer

**Key architectural decision: Research is a SKILL, not an agent**

Any agent can use the research skill. This makes sense because:
- Engineers research documentation
- CMO researches marketing practices
- Product researches competitors

**Research skill structure:**
- Sub-agent 1: Searching online
- Sub-agent 2: Creating report from findings
- Returns: nuanced information, gaps, unexpected-but-important findings

**Verification pattern: Dual research**
- Every research conducted twice by separate sub-agents
- Compare results for divergence
- If divergence too high → third sub-agent tiebreaker
- Citations with URLs required for fact-checking

**When research happens:**
- Self-initiated by each agent (they decide when they need it)
- Common because agents become outdated, world changes
- Avoid building in a vacuum
- Research topics: competitors, market, user sentiment (Reddit), best practices

**Unsupported claims:**
- Handled socially through hierarchy (executives address in 1:1s or direct messages)
- Not automated enforcement

**Research depth:**
- Caller-specified (quick lookup vs deep dive)
- Stake-informed (vision-level generally = deep dive)
- Not mutually exclusive - agent uses judgment

---

## 6. Agent Taxonomy

**Three-tier structure:**

### Tier 1: Board of Directors
- Real famous people (Jony Ive, Alex Hormozi suggested)
- High-level strategic input
- Invoked for major decisions

### Tier 2: Consultants
- Real people triggered for specific expertise
- Examples: Ryan Singer (product/shaping), DHH (technical), Alex Hormozi (business/growth)
- Domain experts called on when expertise needed
- Not always present - triggered when relevant

### Tier 3: Company Roles
- Defined positions: CTO, CEO, CMO, engineers, managers, etc.
- NOT based on specific real people
- We define how they operate (behavioral specifications)
- Operational continuity

**Conflict resolution between consultants:**
- Executive with authority asks questions to understand perspectives completely
- Tries to find middle ground if possible
- Makes decision with explicit reasoning
- Decision based on data when available
- If data unavailable but researchable → research first
- If pure framework/opinion → executive decides

---

## 7. Workflow & Triggering

**Decision: Parallel exploration with checkpoints + dependencies**

**Parallel work:**
- Multiple agents work simultaneously on a phase
- Sync at defined checkpoints to combine findings
- Multiple agents per phase ensures discussion and quality

**Stage dependencies:**
- Vision required before Brainstorm
- Vision required before PRD
- Brainstorm optional
- PRD required before Code
- These are for product features

**Trigger rules:**
- Agents have conditions: "coder stays idle until he has a task"
- Event-driven where it makes sense

**Founder involvement:**
- Can flag specific decisions they want to make
- Gets prompted when options are ready (e.g., "I want to decide the logo")
- Not involved in every decision by default

**Code review:**
- Before or after every commit (not batched)
- Prevents AI drift
- Not only when explicitly requested
- Option: commit then review, second commit for fixes (allows revert if needed)

**Automation level:**
- Fully automated when: confident with data, OR user preference stated, OR at set checkpoints
- User drives high-level flow but doesn't micromanage

---

## 8. Culture Principles (from user's reference docs)

### High-Performance Culture
- Skillful, trusting, collaborative, learning-driven, psychologically safe
- NOT grinding, not requiring immediate availability, allows failure
- High recruiting bar (quality over speed)
- Continuous feedback from managers
- Skip-level communication exists
- Learn by osmosis from high performers

### Rationality Principle
- Use logic and data to find path forward
- Behave as scientists - open to being wrong
- Acknowledge confirmation bias but fight it
- Truth-seeking: disagreements resolved by sharing data
- "Flattens the hierarchy – ideas evaluated on their merits, rather than their source"

---

## 9. Directory Structure & File Organization

**Decision: Agent-centric structure with shared definitions**

### Core Principles
1. **Agent-centric architecture** - agents are the organizing principle
2. **Skills contain workflow dependencies** - PRD skill knows vision is required
3. **Dynamic agent invocation** - skills trigger agents based on dependencies
4. **Shared agent definitions** - agents live outside projects, projects contain only artifacts
5. **Doc lookup order:** project docs first → company docs second

### Proposed Structure
```
agents/
  board/jony-ive.md, alex-hormozi.md
  consultants/ryan-singer.md, dhh.md
  company/cto.md, ceo.md, product-manager.md, engineer.md

skills/
  research.md          # contains: sub-agent structure, verification pattern
  prd.md               # contains: dependency on vision, triggers
  code-review.md       # contains: trigger conditions
  brainstorm.md
  ...

company/
  docs/                # company-wide documentation
    vision.md          # company vision (different from project vision)
    culture.md
    ...
  decisions/           # company-wide decision logs

projects/
  {project-name}/
    docs/
      vision.md        # project-specific vision
      prd/
      brainstorm/
    decisions/         # project-specific decision logs
    tasks/
    code/
```

### Key Insight: Skills as Workflow Engine
Skills aren't just "how to do X" - they encode:
- Dependencies (PRD requires vision)
- Triggers (when to invoke)
- Which agents to call
- What artifacts to produce

This allows agent-centric organization while skills handle the workflow orchestration.

---

## 10. Agent Instruction Format

### Decided Structure (for Company Roles)

```markdown
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
- [inspired by excellent practitioners without naming specific person]

## Triggers
- Invoked when: [conditions - must be well-defined for orchestrator]
- Participates in: [recurring activities]

## Delegations
- [what this agent delegates to others]
- CRITICAL: Every delegation includes INTENT
- "No order is complete without an intent" - enables micro-decisions
```

### Key Decisions

**Removed: Blind Spots**
- We want high-performing agents, not flawed ones
- Don't bake in weaknesses

**Added: Delegations with Intent**
- Every delegation must include the original intent
- Sub-agents compare micro-decisions against intent
- Concept from "Principles of Product Development Flow"

**Communication Style Caliber**
- Not generic bureaucrat CTOs
- Inspired by people like Patrick & John Collison (Stripe founders)
- High-caliber thinking without making agent = specific person

**Culture Baked In**
- No fear of talking to superiors
- Anyone can escalate or ask for second opinions
- Managers not afraid to talk to their boss
- No one afraid of being fired

### Board & Consultant Format (Real People)

- Named consultants ARE the real person (Ryan Singer = Ryan Singer)
- Description includes all their known work (Shape Up + other writings)
- Front matter must be well-defined (past experience: too-long descriptions prevent proper triggering)

### Generic Contrarian Roles

- Some agents are generic roles, not real people
- Example: "Devil's Advocate" - always presents contrarian perspective
- Must be constructive, not obstructionist

### Trigger Mechanism - RESOLVED

**Decision: Option C - Hybrid (rules + reasoning)**

Skills define the primary workflow and required agents. Agent descriptions exist for the orchestrator to pull in additional agents when it recognizes the need (e.g., invoking "Devil's Advocate" when detecting groupthink).

**Lessons from past experience (why agents failed to trigger):**

1. **Description too long** - Chief-of-staff had massive description with examples in YAML frontmatter. Claude can't pattern-match against walls of text.
   - **Fix:** Keep description short and action-oriented. Move examples to body.

2. **Skill vs Agent confusion** - Code-review was a skill but contained subagent orchestration. Mixed concerns.
   - **Fix:** Clear separation of responsibilities.

**Decision Framework: Skill vs Agent**

| If the file... | Make it a... |
|----------------|--------------|
| Provides checklists, standards, reference material | Skill |
| Needs tool restrictions different from main agent | Agent |
| Should run in isolated context (separate window) | Agent |
| Orchestrates other agents | Agent |
| Is complex enough that it benefits from model: opus | Agent |

**Key principles:**
- Short, action-oriented descriptions in front matter for triggering
- Move examples and detailed instructions to the body
- **Skills = knowledge injection** (checklists, standards, how-to)
- **Agents = isolated execution** (separate context, tools, orchestration)

### Foundational Books - The Company Library

**Decision:** Books are written INTO agent definitions (distilled principles). The company maintains a "library" - a documented collection of influential books that shape agent behavior.

**How books are used:**
- Current CLAUDE.md content (with its book references) goes into the Coder agent
- Agent creation skill should ask which books to reference for new agents
- Principles are distilled and baked into agent behavior

---

## 11. Company Library

The complete collection of books that inform agent behavior, organized by domain:

### Leadership & Management
- High Output Management - Andrew S. Grove
- The Manager's Path - Camille Fournier
- The Art of Leadership - Michael Lopp
- The Coaching Habit - Michael Bungay Stanier
- An Elegant Puzzle - Will Larson
- The Staff Engineer's Path - Tanya Reilly
- Become an Effective Software Engineering Manager - James Stanier
- The Leadership Gap - Lolly Daskal
- Trillion Dollar Coach - Eric Schmidt (about Bill Campbell)
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

---

## 12. Memory & State Persistence

### Core Principle: Memory Approach is a Skill

The memory approach is defined as a skill that every agent references. Written in each agent's body markdown. If we change the approach later, we just update the skill.

### Memory Components

**1. Meeting Notes**
- Directory: `projects/{project}/meeting-notes/`
- Filename format: `{date}_{session-id}_{topic-or-decision}.md`
- Contains: full discussion details, participants, conclusions
- Agents document conclusions whenever they reach them

**2. Agent Working Memory**
- Each agent has their own working memory file
- Tracks: recent decisions participated in, open questions, context
- **CRITICAL:** Every memory entry tagged with project name for easy retrieval
- Location: `projects/{project}/agent-memory/{agent-name}.md`

**3. Session Handoff Recaps**
- Like Monday alignment meetings in companies
- Generated at end of each session
- Summarizes: decisions made, questions raised, state of work
- Next session starts by reading the recap

### File Reader Agent (NEW)

**Purpose:** Context window management. Prevents agents from loading large files directly.

**How it works:**
1. Receives prompt about what the requesting agent wants
2. Searches the document
3. Reads the whole document following the prompt
4. Returns: conclusion + relevant snippet + line numbers (ALWAYS)
5. Requesting agent can reference back using line numbers

**Scope:** For document reading only. Does NOT apply to developers who use normal code reading tools.

**Why it exists:** If CTO loads a large file directly, context window gets consumed. File Reader agent isolates that cost.

### Portability Principle

**Memories are project-specific. Agents and skills are portable.**

- All memory files live under `projects/{project}/`
- When duplicating the company structure for a new company/project, only copy `agents/` and `skills/`
- Memories don't transfer - each project starts fresh

### Updated Directory Structure

```
agents/                          # PORTABLE - copy to new companies
  board/
  consultants/
  company/
  file-reader.md                 # The File Reader agent

skills/                          # PORTABLE - copy to new companies
  memory.md                      # How to use memory (referenced by all agents)
  research.md
  prd.md
  ...

company/                         # Company-wide, not project-specific
  docs/
  decisions/

projects/
  {project-name}/
    docs/
    decisions/
    meeting-notes/               # NEW - discussion logs
      2024-01-15_sess-001_microservices-decision.md
    agent-memory/                # NEW - per-agent working memory
      cto.md
      product-manager.md
    session-recaps/              # NEW - session handoffs
      2024-01-15_recap.md
    tasks/
    code/
```

---

## 13. Orchestrator & Deliberation Roles

### Two Distinct Roles

**Orchestrator**
- Handles workflow/triggering
- Decides which agents to invoke based on skills and workflow state
- Manages the "what happens next?" question

**Facilitator (formerly "Council President")**
- Handles deliberation and coordination when multiple agents (5-6-7+) need to discuss
- Collects different opinions from agents
- Provides counterarguments and contrarian perspectives back to them
- Keeps discussion going until final conclusion is reached
- Acts as a "hub agent" for multi-agent discussions

*Name options: Facilitator, Moderator, Discussion Lead*

### Board of Directors Has Its Own Structure

- Board has a **Chairman** who coordinates board discussions
- Chairman discusses with board members directly
- Does NOT use the Facilitator - the board is self-coordinating

### Model Capability

**Default to the most capable model unless the user specifies otherwise.**

Orchestrator and Facilitator should use the most capable model since they make meta-decisions.

### Error Correction

- Whoever is talking to the Facilitator can push back on poor calls
- They can escalate to their bosses
- Normal hierarchy handles correction

### The "Thinking Sub-Agent" Pattern

**Problem:** If CTO makes a decision alone, it could hallucinate. Even one agent making a decision should have internal deliberation.

**Solution:** When an agent (like CTO) needs to think through possibilities:
1. It spawns "thinking" sub-agents to explore different options
2. These sub-agents act like "ideas in its brain"
3. Each thinking sub-agent has no bias (isolated context)
4. Their memory is attached only to that session with the parent agent
5. Once decision is made, thinking sub-agents "die"/disappear
6. Parent agent annotates the final decision

**This reduces hallucination** because multiple isolated perspectives are considered.

### Parallel Sub-Agent Instances

**Question raised:** How do we handle parallel thinking? If CTO and CMO both need thinking sub-agents at the same time, how do they not collide?

**Answer: Sub-agents are stateless instances.**

In Claude Code's sub-agent model:
- Each sub-agent call spawns a **new, independent instance**
- They don't share state with each other
- CTO's thinking sub-agent and CMO's thinking sub-agent are completely separate
- No collision possible - they're isolated by design

**This is NOT a shared "thinking agent" that multiple callers use.** Each invocation creates a fresh instance with only the context passed to it.

### Is "Thinking" a Skill or Agent?

**Answer: It's a SKILL that instructs how to spawn sub-agents.**

The thinking skill would:
- Define when to use thinking sub-agents (complex decisions, multiple possibilities)
- Specify how many perspectives to spawn
- Describe how to synthesize results
- Be referenced in agent definitions that need deliberative thinking

The actual sub-agents spawned are ephemeral - they don't have persistent agent files.

---

## 14. Project Kickoff & Founder Preferences

### Who Handles Kickoff

**Director of Product Strategy** - An agent whose job is to interview whoever started the project (user or another agent) and gather the necessary information.

### Discovery-Based, Not Checklist

The agent should **discover what's missing** and ask questions, rather than following a fixed checklist. Questions are directed to whoever initiated the conversation.

### Minimum Vision Requirements

From the user's doodle, a vision document needs at minimum:
1. **Where we are** - Current state
2. **What the problem is** - Even high level is fine
3. **How painful it is** - Qualify the problem's severity
4. **Where we want to go** - End goal
5. **Some alternatives** - Non-exhaustive options for how to get there
6. **Constraints** - The more complete, the better for product managers

### Document Standards (NEW SKILLS)

**TLDR Skill**
- Every document should have a TLDR
- This is a skill that all document-producing agents reference
- Ensures consistency across all artifacts

**Document Structure Skill**
- Paragraphs for narrative content
- Open questions section
- High-level guardrails/checklists to keep

### Project Kickoff Workflow

1. User or agent initiates a new project
2. Director of Product Strategy is triggered
3. Director interviews the initiator to uncover:
   - Vision minimum requirements (above)
   - Decision involvement preferences ("I want to decide X")
   - Constraints and non-negotiables
   - Risk tolerance
   - Any other context the agent discovers is needed
4. Vision document is created
5. Project can proceed to next phases

---

## Open Questions (still to discuss)

- [ ] Cost/token management
- [ ] Legal/ethical considerations for real-people agents
- [ ] Naming decision: Facilitator vs Moderator vs other?
- [ ] First project to test this system with?

---

*Notes will be updated as interview continues*
