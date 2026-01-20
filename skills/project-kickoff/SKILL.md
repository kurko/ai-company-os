---
name: "Project Kickoff"
description: "Discover requirements and route projects to the right team. Use when starting a new initiative."
---

# Project Kickoff

Conduct discovery interviews and route projects to appropriate departments.

## When to Use

- Starting a new product or feature
- User brings an idea or problem
- Unclear which team should own something
- Need to establish project parameters

## Dependencies

- None - this is the entry point

## Book Triggers

Reference: [[books/product-innovation.md]]
- Apply "Inspired" discovery interview techniques
- Use "Escaping the Build Trap" problem focus

Reference: [[books/leadership-management.md]]
- Apply "High Output Management" for routing decisions

---

## Kickoff Process

### Phase 1: Discovery Interview

**Goal:** Understand what we're building and why.

The Director of Product Strategy (or Co-founder) conducts the interview:

1. **Open exploration**
   - "What prompted this?"
   - "What problem are you trying to solve?"
   - "Who experiences this problem?"

2. **Vision requirements** (from vision.md)
   - Where we are (current state)
   - What the problem is
   - How painful it is
   - Where we want to go
   - Some alternatives
   - Constraints

3. **Involvement preferences**
   - "Which decisions do you want to make personally?"
   - "What can the team decide autonomously?"
   - "How do you want to be kept informed?"

4. **Constraints and non-negotiables**
   - Timeline
   - Budget/resources
   - Technical constraints
   - Business constraints

### Phase 2: Department Routing

Based on discovery, determine which departments are needed:

| Project Type | Primary Owner | Supporting |
|--------------|---------------|------------|
| New product | Product Director | Engineering, Marketing |
| Feature addition | Product Manager | Engineering |
| Technical improvement | Engineering Director | Product |
| Marketing initiative | Marketing Director | Product |
| Strategic pivot | CEO/Board | All |

### Phase 3: Handoff

Create initial artifacts:
1. **Vision document** (invoke vision.md skill)
2. **Project assignment** to owning department
3. **Communication preferences** documented

---

## Discovery Interview Template

```markdown
# Kickoff: [Project Name]

**Date:** YYYY-MM-DD
**Interviewer:** [Who conducted]
**Stakeholder:** [Who was interviewed]

## Opening

**What prompted this?**
[Response]

**In your own words, what are we trying to do?**
[Response]

## Problem Discovery

**What problem does this solve?**
[Response]

**Who experiences this problem?**
[Response]

**How are they solving it today?**
[Response]

**How painful is this? (1-10)**
[Response with explanation]

**What happens if we don't address this?**
[Response]

## Success Discovery

**What would success look like?**
[Response]

**How would we measure success?**
[Response]

**What would make this a failure?**
[Response]

## Constraint Discovery

**What can't change?**
[Response]

**When does this need to be done?**
[Response]

**What resources are available?**
[Response]

**What other projects compete for these resources?**
[Response]

## Involvement Preferences

**Which decisions do you want to make personally?**
[Response]

**What can the team decide without you?**
[Response]

**How do you want to be kept informed?**
[Response]

## Additional Notes

[Anything else that came up]

---

## Routing Decision

**Primary Owner:** [Department/Role]
**Supporting Teams:** [List]
**Rationale:** [Why this routing]

## Next Steps

- [ ] Create vision document
- [ ] Schedule kickoff with owning team
- [ ] [Other follow-up actions]
```

---

## Routing Guidelines

### Route to Product

- New user-facing features
- Product strategy questions
- Market/competitive concerns
- User experience issues

### Route to Engineering

- Technical architecture decisions
- Infrastructure improvements
- Performance/security concerns
- Developer experience

### Route to Marketing

- Go-to-market strategy
- Brand/messaging
- Growth initiatives
- Customer communication

### Route to Board

- Major strategic pivots
- Large resource commitments
- Company-level direction
- Risk assessment for big bets

---

## Post-Kickoff Flow

```
Kickoff Interview
       |
       v
Vision Document Created (vision.md)
       |
       v
Route to Department
       |
       +---> Product: Continue to brainstorm/PRD
       |
       +---> Engineering: Technical discovery
       |
       +---> Marketing: Market research
       |
       +---> Board: Strategic discussion
```

---

## Quality Checklist

- [ ] All vision requirements captured
- [ ] Pain level quantified
- [ ] Success criteria identified
- [ ] Constraints documented
- [ ] Involvement preferences clear
- [ ] Routing decision made with rationale
- [ ] Next steps assigned

---

## Integration

### With vision.md
- Kickoff produces inputs for vision
- Vision skill structures the outputs

### With product-development-flow.md
- Kickoff is the entry point
- Routes to appropriate stage

### With facilitator.md
- For projects needing multi-department input
- Facilitator coordinates cross-functional kickoff

---

## Anti-Patterns

- **Skipping discovery** - Don't assume you know the problem
- **Solution-first** - Start with problem, not solution
- **Missing constraints** - Constraints shape everything
- **Unclear ownership** - Every project needs one owner
- **No involvement preferences** - Ask, don't assume
- **Routing by habit** - Match project to right team
