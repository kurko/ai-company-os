---
name: "Create Skill"
description: "Create or improve Claude Code skills. Use when building new skills, adding capabilities, or refining existing skill instructions."
---

# Create Skill

Create well-structured Claude Code skills that integrate with the agent system.

## When to Use

- Creating a new skill from scratch
- Improving or refactoring an existing skill
- Adding capabilities to the agent system
- Standardizing skill format across the codebase

## Dependencies

Load these skills:

- **thinking.md** - For decomposing complex skill requirements
- **create-agent.md** - Reference for agent creation (skills live alongside agents)

---

## Design Principles

### 1. Conciseness Priority

Only include context Claude does not already have. Skip:
- General programming knowledge
- Common patterns Claude knows well
- Explanations of basic concepts

Focus on:
- Project-specific conventions
- Domain knowledge unique to your system
- Non-obvious integration points

### 2. Description Field Drives Triggering

The YAML `description` field is the most critical element for skill invocation. It must:
- Include action words that match how users ask for help
- Mention "when to use" conditions
- Stay under 20 words while being specific

**Good:** `"Create or improve Claude Code skills. Use when building new skills or refining skill instructions."`

**Bad:** `"A skill for creating skills"` (too vague, no trigger conditions)

### 3. Progressive Disclosure

| Section | Target Length | Purpose |
|---------|---------------|---------|
| YAML metadata | ~100 words max | Triggering and routing |
| One-liner | 1 sentence | Quick orientation |
| When to Use | 3-5 bullets | Activation conditions |
| Main content | Under 5k words | The actual instructions |

### 4. Degrees of Freedom

Match constraint level to task fragility:

| Task Type | Constraint Level | Example |
|-----------|------------------|---------|
| High fragility | Strict templates, checklists | Database migrations |
| Medium fragility | Guidelines with examples | API design |
| Low fragility | Principles only | Creative writing |

For skills, err toward **medium fragility** - provide structure but allow judgment.

---

## Skill File Structure

### Required: YAML Front Matter

```yaml
---
name: "[Skill Name]"
description: "[Action-oriented trigger phrase. Include when-to-use conditions. Under 20 words.]"
---
```

### Required: Core Sections

```markdown
# [Skill Name]

[One-line purpose statement.]

## When to Use

- [Trigger condition 1]
- [Trigger condition 2]
- [Trigger condition 3]

## Dependencies

- **[skill-name].md** - [Why this dependency exists]
- (Or: "None - this is a core skill")

## [Main Content Sections]

[The actual skill content - frameworks, patterns, checklists, templates]

## Output Format

[Expected output structure when using this skill]
```

### Optional: Enhancement Sections

```markdown
## Book Triggers

Reference: [[books/{domain}.md]]
- Apply "[Book]" for [specific application]

## Integration

How this skill connects to other skills:
- With [other-skill]: [how they work together]

## Anti-Patterns

- [What to avoid when using this skill]
```

---

## Skill Template

Use this template when creating new skills:

```markdown
---
name: "[Skill Name]"
description: "[Short action-oriented trigger with when-to-use conditions]"
---

# [Skill Name]

[One-line description of what this skill does.]

## When to Use

- [Trigger condition - be specific]
- [Another trigger condition]
- [When NOT to use, if helpful]

## Dependencies

- **[dependency].md** - [Why needed]
- (Or: "None - this is a core skill")

## Book Triggers

Reference: [[books/{relevant-domain}.md]]
- Apply "[Book Name]" for: [specific application]

## [Primary Content Section]

[Main instructions, frameworks, or patterns. This is the meat of the skill.]

### [Subsection if needed]

[Break down complex instructions into digestible pieces.]

## Output Format

[What the skill produces. Include a template if the output is structured.]

```markdown
## [Output Header]

[Template structure]
```

## Integration

- With [other-skill]: [how they combine]
- Called by: [which agents or workflows invoke this]

## Anti-Patterns

- [Common mistake to avoid]
- [Another pitfall]

## Checklist

Before completing skill execution:

- [ ] [Verification step 1]
- [ ] [Verification step 2]
```

---

## Naming Conventions

| Category | Pattern | Examples |
|----------|---------|----------|
| Core skills | `{name}.md` | `thinking.md`, `memory.md` |
| Product flow | `{stage}.md` | `vision.md`, `prd.md` |
| Engineering | `{name}.md` | `code-review.md` |
| Utility | `utility-{name}.md` | `utility-git-commit.md` |
| Domain-specific | `{domain}-{action}.md` | `rails-migrate.md` |

---

## Advanced: Skill Directory Structure

For complex skills that need supporting files:

```
skills/
  my-skill/
    SKILL.md           # Main skill file (required)
    scripts/           # Helper scripts (optional)
      validate.sh
    references/        # Reference documents (optional)
      examples.md
    assets/            # Images, diagrams (optional)
      workflow.png
```

The `SKILL.md` file follows the same format as a standalone `.md` skill file.

---

## Integration with Agent System

### How Skills Are Invoked

1. **Direct invocation**: User or agent explicitly calls the skill
2. **Trigger matching**: Description field matches user intent
3. **Agent reference**: Listed in an agent's `## Skills` section

### Skill Dependencies

Declare dependencies that the orchestrator can verify:

```markdown
## Dependencies

### Required
- **vision.md** - Cannot create PRD without vision
  - Check: `projects/{project}/docs/vision.md` exists

### Optional
- **research.md** - For market research if needed
```

### Cross-Skill Workflow

Document how skills chain together:

```markdown
## Integration

Typical workflow with this skill:
1. thinking.md -> decompose the problem
2. [this-skill].md -> execute the core task
3. decision-making.md -> evaluate results
```

---

## Checklist: Before Creating a Skill

### Content Validation

- [ ] One-liner clearly states purpose
- [ ] When to Use has 3-5 specific triggers
- [ ] Dependencies declared (or explicitly "none")
- [ ] Main content is actionable, not just descriptive
- [ ] Output format is specified
- [ ] Examples included where helpful

### YAML Front Matter

- [ ] `name` is concise and descriptive
- [ ] `description` includes action words AND trigger conditions
- [ ] `description` is under 20 words

### Quality Checks

- [ ] Follows progressive disclosure (most important info first)
- [ ] No redundant explanations of common knowledge
- [ ] Constraint level matches task fragility
- [ ] Anti-patterns section prevents common mistakes
- [ ] Integration points documented

### Naming and Location

- [ ] Filename follows naming conventions
- [ ] Placed in correct directory (`skills/`)
- [ ] If complex, uses directory structure with `SKILL.md`

---

## Output Format

When this skill completes, produce:

1. **The skill file** at the specified path
2. **Summary** of what the skill does and its trigger conditions
3. **Integration notes** on how it connects to existing skills/agents

---

## Anti-Patterns

- **Kitchen sink skills**: Trying to do too much in one skill
- **Vague descriptions**: Description field that won't trigger correctly
- **Missing output format**: Skill without clear deliverable
- **Undeclared dependencies**: Skills that assume other skills without stating it
- **Over-explanation**: Including context Claude already has
- **No trigger conditions**: "When to Use" that's too generic to be actionable
