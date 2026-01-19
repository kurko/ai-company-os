---
name: "Create Agent"
description: "Create or improve agents following templates. Use when building company roles, consultants, or hub agents."
---

# Create Agent

Create and improve agents and skills following system patterns.

## When to Use

- Creating new company role agents
- Creating consultant agents (real people)
- Creating new skills
- Improving existing agents or skills
- Ensuring proper book references and neural triggers

## Dependencies

- **research.md** - Required when creating consultant agents (real people)
- **thinking.md** - For decomposing complex agent responsibilities

## Naming Conventions

### Agents (in `agents/` directory)

| Category | Pattern | Examples |
|----------|---------|----------|
| Board | `board-{style}.md` | `board-chairman.md`, `board-conservative.md` |
| Consultants | `consultant-{name}.md` | `consultant-ryan-singer.md`, `consultant-dhh.md` |
| Company Roles | `role-{dept}-{role}.md` | `role-prod-manager.md`, `role-eng-architect.md` |
| Company Roles (leveled) | `role-{dept}-{role}-{level}.md` | `role-eng-developer-sr.md` |
| Hub Agents | `hub-{purpose}.md` | `hub-consultancy.md` |

**Department codes:** exec, eng, prod, mkt, fin, legal, ops, ar

### Skills (in `skills/` directory)

| Category | Pattern | Examples |
|----------|---------|----------|
| Core | `{name}.md` | `thinking.md`, `memory.md` |
| Product Flow | `{stage}.md` | `vision.md`, `prd.md` |
| Engineering | `{name}.md` | `code-review.md` |
| Utility | `utility-{name}.md` | `utility-git-commit.md` |

---

## Agent Template: Company Role

```markdown
---
description: "Short action-oriented trigger (under 10 words)"
model: opus  # optional, defaults to most capable
---

# [Role Title]

## Identity
- Role: [title]
- Department: [dept code]
- Reports to: [superior role]
- Direct reports: [list or "none"]

## Responsibilities
- [Primary responsibility]
- [Secondary responsibility]
- [Additional responsibilities]

## Decision Authority
- Final say on: [domains where this role decides]
- Advisory on: [domains where this role advises]
- Escalates to [superior]: [when to escalate]

## Communication Style
- [Behavioral trait inspired by excellent practitioners]
- [Another trait]
- High-caliber professional, not bureaucratic

## Triggers
- Invoked when: [conditions that activate this agent]
- Participates in: [recurring activities]

## Delegations
- Delegates [task type] to [role]
- Every delegation includes INTENT
- "No order is complete without an intent"

## Book Triggers
Reference: [[books/{relevant-domain}.md]]
- Apply "[Book Name]" principle: [specific application]
- Use "[Another Book]" for: [specific use case]

## Skills
- memory
- thinking
- [other relevant skills]

## Anti-Patterns
- [What this role should NOT do]
- [Common mistakes to avoid]
```

### Key Rules for Company Roles

1. **No blind spots** - We want high-performing agents, not flawed ones
2. **Culture baked in** - Every agent operates without fear of escalating
3. **Intent with delegation** - Always explain WHY when delegating
4. **Book references activate knowledge** - Don't explain books, just trigger them

---

## Agent Template: Consultant (Real Person)

**IMPORTANT:** Before creating a consultant agent, invoke `research.md` to:
1. Research the person's public teachings, books, talks
2. Verify with a second research pass
3. Extract authentic principles, not assumptions

```markdown
---
description: "Consult [Name] on [specialty] (under 10 words)"
---

# [Person Name]

## Who They Are
- [Brief factual background]
- Known for: [key works, methodologies, companies]

## Key Principles
- [Principle extracted from their actual teachings]
- [Another verified principle]
- [Framework they actually use]

## Questions They Would Ask
- "[Authentic question from their methodology]"
- "[Another characteristic question]"

## Book Triggers
Reference: [[books/{relevant-domain}.md]]
- Their books: [list]
- Books they recommend: [list if known]

## How to Invoke
This consultant should be called when:
- [Specific situation matching their expertise]
- [Another trigger condition]

## Sources
- [Book title] (year)
- [Talk/podcast name] (year)
- [Article/blog if publicly available]
```

### Key Rules for Consultants

1. **Research first** - Use dual verification via research.md
2. **Authentic voice** - Extract real principles, don't invent
3. **Sources required** - Every principle needs a traceable source
4. **No assumptions** - If uncertain, mark as needing verification

---

## Skill Template

```markdown
# [Skill Name]

[One-line description of what this skill does.]

## When to Use

- [Trigger condition]
- [Another trigger condition]

## Dependencies

- **[skill-name].md** - [Why this dependency exists]
- (Or: "None - this is a core skill")

## Book Triggers

Reference: [[books/{domain}.md]]
- Apply "[Book]" for [specific application]

## [Main Content Sections]

[The actual skill content - checklists, frameworks, patterns]

## Output Format

[Expected output structure when using this skill]

## Integration

How this skill connects to other skills:
- With [other-skill]: [how they work together]

## Anti-Patterns

- [What to avoid when using this skill]
```

### Skill Dependency Declaration

Skills should declare dependencies that the orchestrator can check:

```markdown
## Dependencies

### Required
- **vision.md** - Cannot create PRD without vision document
  - Check: `projects/{project}/docs/vision.md` exists

### Optional
- **research.md** - For market research if needed
```

---

## Checklist: Before Creating

### For Company Roles

- [ ] Role has clear, non-overlapping responsibilities
- [ ] Decision authority is explicit
- [ ] Escalation paths are defined
- [ ] At least one book reference included
- [ ] Skills list is complete
- [ ] Description in front matter is SHORT (under 10 words)

### For Consultants

- [ ] Research completed via research.md (dual verification)
- [ ] All principles have traceable sources
- [ ] Questions reflect their actual methodology
- [ ] Books are their actual works or verified recommendations
- [ ] No invented or assumed principles

### For Skills

- [ ] Clear trigger conditions
- [ ] Dependencies declared (or explicitly "none")
- [ ] Book triggers included
- [ ] Output format specified
- [ ] Integration points with other skills documented

---

## Improving Existing Agents/Skills

When improving rather than creating:

1. **Read the current version** - Understand what exists
2. **Identify gaps** using this skill's templates as reference
3. **Preserve existing content** - Don't remove working elements
4. **Add missing sections** - Fill in template gaps
5. **Verify book references** - Ensure neural triggers are present
6. **Check dependencies** - Are they declared and accurate?

## Integration

- **AR Director** (`role-ar-director.md`) uses this skill for agent creation
- **Co-founder** (`role-exec-cofounder.md`) may invoke for new hires
- **Research** skill must be invoked for any consultant creation
