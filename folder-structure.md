# Vision-to-Product: Folder Structure

## Complete Directory Tree

```
vision-to-product/
│
├── agents/                             # All agents (FLAT - no subdirectories)
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # BOARD OF DIRECTORS
│   │── # ═══════════════════════════════════════════════════════════════════
│   ├── board-chairman.md               # Facilitates board discussions
│   ├── board-conservative.md           # Risk-averse thinking style
│   ├── board-aggressive.md             # Growth-focused style
│   ├── board-technical.md              # Deep technical perspective
│   ├── board-customer.md               # Customer/market perspective
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # CONSULTANTS (Real People)
│   │── # ═══════════════════════════════════════════════════════════════════
│   ├── consultant-ryan-singer.md       # Shape Up methodology
│   ├── consultant-dhh.md               # Technical philosophy
│   ├── consultant-jony-ive.md          # Design excellence
│   ├── consultant-alex-hormozi.md      # Business/growth
│   ├── consultant-sandi-metz.md        # OOP design
│   ├── consultant-devils-advocate.md   # Unbiased contrarian perspective
│   ├── consultant-anonymous.md         # Quick opinions (no persona)
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # COMPANY ROLES BY DEPARTMENT
│   │── # Pattern: role-{dept}-{role}-{level}.md
│   │── # Departments: exec, eng, prod, mkt, fin, legal, ops, ar
│   │── # ═══════════════════════════════════════════════════════════════════
│   │
│   │── # --- Executive ---
│   ├── role-exec-cofounder.md         # The AI itself (first agent)
│   ├── role-exec-ceo.md
│   ├── role-exec-cto.md
│   ├── role-exec-cmo.md
│   ├── role-exec-cfo.md
│   │
│   │── # --- Product ---
│   ├── role-prod-director.md           # Director of Product Strategy
│   ├── role-prod-manager.md            # Product Manager
│   ├── role-prod-designer.md           # Product Designer
│   ├── role-prod-researcher.md         # User Researcher
│   │
│   │── # --- Engineering ---
│   ├── role-eng-director.md            # Director of Engineering
│   ├── role-eng-manager.md             # Engineering Manager
│   ├── role-eng-architect.md           # Software Architect
│   ├── role-eng-developer-sr.md        # Senior Developer
│   ├── role-eng-developer.md           # Developer
│   ├── role-eng-devops.md              # DevOps Engineer
│   ├── role-eng-security.md            # Security Engineer
│   ├── role-eng-qa.md                  # QA Engineer
│   │
│   │── # --- Marketing ---
│   ├── role-mkt-director.md            # Director of Marketing
│   ├── role-mkt-content.md             # Content Strategist
│   ├── role-mkt-growth.md              # Growth Marketer
│   │
│   │── # --- AI Resources (writes agents) ---
│   ├── role-ar-director.md             # Director of AI Resources
│   │
│   │── # --- Finance (Future) ---
│   │── # role-fin-controller.md
│   │── # role-fin-analyst.md
│   │
│   │── # --- Legal (Future) ---
│   │── # role-legal-counsel.md
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # HUB AGENTS (Coordinate other agents)
│   │── # ═══════════════════════════════════════════════════════════════════
│   └── hub-consultancy.md              # Spawns relevant consultants
│
├── skills/                             # All skills
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # CORE SKILLS (No dependencies)
│   │── # ═══════════════════════════════════════════════════════════════════
│   ├── thinking.md                     # Complex problem decomposition
│   ├── decision-making.md              # Tier 0 axioms & principles
│   ├── writing-documents.md            # TLDR, structure, formatting
│   ├── memory.md                       # Working memory, session recaps
│   ├── facilitator.md                  # Coordinating multi-agent discussions
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # RESEARCH & CREATION SKILLS
│   │── # ═══════════════════════════════════════════════════════════════════
│   ├── research.md                     # Dual-mode: project + meta research
│   ├── create-agent.md                 # Create/improve agents & skills
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # PRODUCT DEVELOPMENT FLOW
│   │── # (Each skill has dependencies on previous stages)
│   │── # ═══════════════════════════════════════════════════════════════════
│   ├── product-development-flow.md     # Meta-skill: orchestrates full flow
│   ├── vision.md                       # Create vision documents
│   ├── brainstorm.md                   # Ideation (depends: vision)
│   ├── prd.md                          # PRD creation (depends: vision)
│   ├── user-stories.md                 # Story breakdown (depends: prd)
│   ├── backlog.md                      # Prioritization (depends: stories)
│   ├── project-kickoff.md              # Routes to correct department
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # ENGINEERING SKILLS
│   │── # ═══════════════════════════════════════════════════════════════════
│   ├── code-review.md                  # Review standards
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # UTILITY SKILLS (Tooling, sorted together with utility- prefix)
│   │── # ═══════════════════════════════════════════════════════════════════
│   ├── utility-git-commit.md           # Conventional commits
│   ├── utility-file-reader.md          # Context-safe file reading
│   │
│   │── # ═══════════════════════════════════════════════════════════════════
│   │── # COMMUNICATION SKILLS
│   │── # ═══════════════════════════════════════════════════════════════════
│   └── communication.md                # Abstracts Linear/Asana/Jira
│
├── books/                              # Company Library (by domain)
│   ├── index.md                        # Master book index
│   ├── software-craft.md               # Clean Code, GOOS, Sandi Metz
│   ├── systems-thinking.md             # Thinking in Systems, Flow
│   ├── product-innovation.md           # Build Trap, Innovator's Dilemma
│   ├── leadership-management.md        # High Output, Manager's Path
│   ├── startup-business.md             # Lean Startup, Rework
│   ├── thinking-rationality.md         # Scout Mindset, Black Swan
│   └── personal-effectiveness.md       # Deep Work, Atomic Habits
│
├── company/                            # Company-wide (shared across projects)
│   ├── docs/
│   │   ├── vision.md                   # Company vision
│   │   ├── culture.md                  # Culture principles
│   │   └── decision-principles.md      # Tier 0 axioms reference
│   └── decisions/                      # Company-wide decision logs
│       └── {date}_{topic}.md
│
├── projects/                           # Project artifacts (NOT portable)
│   └── {project-name}/
│       ├── docs/
│       │   ├── vision.md               # Project-specific vision
│       │   ├── brainstorm.md
│       │   └── prd/
│       │       └── {feature}.md
│       ├── decisions/                  # Project decision logs
│       │   └── {date}_{topic}.md
│       ├── meeting-notes/              # Discussion logs
│       │   └── {date}_{session}_{topic}.md
│       ├── agent-memory/               # Per-agent working memory
│       │   ├── role-prod-manager.md
│       │   └── role-eng-architect.md
│       ├── session-recaps/             # Session handoffs
│       │   └── {date}_recap.md
│       ├── tasks/
│       └── code/
│
├── backlog/                            # Future work items
│   ├── token-management.md
│   ├── neural-triggers-research.md
│   └── board-structure-research.md
│
├── ai-notes/                           # AI task tracking
│   └── vision-to-product/
│       └── todo.md                     # Build progress tracking
│
├── spec.md                             # System specification
├── spec-notes.md                       # Interview notes
└── folder-structure.md                 # This file
```

## Naming Convention Reference

### Agents

| Category | Pattern | Examples |
|----------|---------|----------|
| Board | `board-{style}.md` | `board-chairman.md`, `board-conservative.md` |
| Consultants | `consultant-{name}.md` | `consultant-ryan-singer.md` |
| Company Roles | `role-{dept}-{role}.md` | `role-prod-manager.md` |
| Company Roles (leveled) | `role-{dept}-{role}-{level}.md` | `role-eng-developer-sr.md` |
| Hub Agents | `hub-{purpose}.md` | `hub-consultancy.md` |

### Skills

| Category | Pattern | Examples |
|----------|---------|----------|
| Core | `{name}.md` | `thinking.md`, `memory.md` |
| Product Flow | `{stage}.md` | `vision.md`, `prd.md` |
| Engineering | `{name}.md` | `code-review.md` |
| Utility/Tooling | `utility-{name}.md` | `utility-git-commit.md`, `utility-file-reader.md` |

### Department Codes

| Department | Code | Example Agent |
|------------|------|---------------|
| Executive | `exec` | `role-exec-ceo.md` |
| Product | `prod` | `role-prod-manager.md` |
| Engineering | `eng` | `role-eng-architect.md` |
| Marketing | `mkt` | `role-mkt-director.md` |
| Finance | `fin` | `role-fin-controller.md` |
| Legal | `legal` | `role-legal-counsel.md` |
| Operations | `ops` | `role-ops-chief.md` |
| AI Resources | `ar` | `role-ar-director.md` |

### Level Suffixes (Optional)

| Level | Suffix | Example |
|-------|--------|---------|
| Senior | `-sr` | `role-eng-developer-sr.md` |
| Lead | `-lead` | `role-eng-developer-lead.md` |
| Director | `-dir` | N/A (use `director` in role name) |
| VP | `-vp` | `role-prod-vp.md` |

## Portability

**Copy to new company:**
- `agents/`
- `skills/`
- `books/`

**Don't copy (project-specific):**
- `company/`
- `projects/`

## Lookup Order

When an agent needs context:
1. `projects/{project}/docs/` (project-specific)
2. `company/docs/` (company-wide)

Project context takes precedence.
