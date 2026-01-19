# CLAUDE.md

Project instructions for the Vision-to-Product multi-agent AI organization.

## Repository Purpose

A multi-agent AI company simulation that takes ideas from vision to shipped product. The system uses:
- **Agents** - Isolated execution contexts (company roles, consultants, board members)
- **Skills** - Knowledge injection (workflows, methodologies, best practices)
- **Books** - Neural triggers that activate relevant knowledge

## Architecture Decisions

### Model Selection

| Role Type | Model | Rationale |
|-----------|-------|-----------|
| All engineers | `opus` | Quality over cost for code (user decision) |
| Executives | `opus` | Strategic thinking, orchestration |
| Directors | `opus` | Domain leadership |
| Managers | `opus` | Team coordination |
| Consultants | `opus` | Expert advisory |
| Utility agents | `haiku` | Simple, repetitive tasks |

**Note:** Engineers always use Opus (overrides default architecture decision for ICs).

### Consultant Standards

- **Depth**: Full research with dual verification (like `consultant-julie-gurner.md`)
- **Voice**: Second-person ("You are [Name]")
- **Sources**: Every principle must have a traceable source
- **Research process**: Use `research.md` skill with dual verification

### Agent Improvement

When improving any agent, invoke `consultant-julie-gurner` for feedback on:
- High standards and expectations
- Motivation vs discipline balance
- Identifying limiting beliefs in agent design
- Performance optimization

## Key Files

- `ai-notes/vision-to-product/todo.md` - Build progress tracking
- `company/decisions/` - Architectural decisions
- `folder-structure.md` - Naming conventions
- `spec.md` - Full specification

## Working with This Codebase

### Creating New Agents

1. Invoke the CAIRO agent (`role-chief-ai-resources-officer.md`)
2. Use the `create-agent.md` skill
3. For consultants: Full research with dual verification required
4. Verify against architecture decisions

### Creating New Skills

1. Use `create-skill.md` skill
2. Include YAML frontmatter with triggering description
3. Document dependencies and output format

### Order of Operations

When building out the organization:
1. Core skills first (Tier 0)
2. Foundation skills
3. Co-founder agent
4. CAIRO for remaining agents
5. Product value chain (prod-manager, eng-developer)
6. Consultants for domain expertise

## Conventions

- Agent files: `agents/{category}-{name}.md`
- Skill files: `skills/{name}.md`
- Book triggers: `books/{domain}.md`
- Decisions: `company/decisions/YYYY-MM-DD_{topic}.md`
