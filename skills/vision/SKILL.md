---
name: "Vision"
description: "Create vision documents for features, products, or company direction. Use when starting something new."
---

# Vision

Create vision documents that anchor all subsequent work.

## When to Use

- Starting a new product or feature
- Clarifying direction for an existing initiative
- Company-level strategic planning
- Any time clarity on "why" and "where" is needed

## Dependencies

- None - this is the first stage in the flow

## Book Triggers

Reference: [[books/product-innovation.md]]
- Apply "Inspired" vision principles
- Use "Escaping the Build Trap" outcome focus

Reference: [[books/startup-business.md]]
- Apply "Lean Startup" hypothesis framing
- Use "Rework" for simplicity and focus

---

## Vision Scope Levels

Vision documents scale based on scope:

| Level | Scope | Example |
|-------|-------|---------|
| Feature | Single capability | "Add dark mode" |
| Epic | Related feature set | "Improve accessibility" |
| Product | Entire product | "Mobile app launch" |
| Company | Organization direction | "Annual strategic plan" |

The same structure applies at all levels, with depth varying by scope.

---

## Minimum Vision Requirements

Every vision document must answer:

1. **Where we are** - Current state
2. **What the problem is** - Even high level
3. **How painful it is** - Qualify severity
4. **Where we want to go** - End goal
5. **Some alternatives** - Non-exhaustive options
6. **Constraints** - The more complete, the better

---

## Vision Document Template

```markdown
# Vision: [Title]

## TLDR

[2-4 sentences: The problem, the direction, and why it matters now.]

## Current State

[Where are we today? What's working? What's not?]

## Problem

### What's Wrong
[The specific problem or opportunity]

### Why It Matters
[Impact on users, business, team]

### Severity
[How painful is this? Quantify if possible.]

## Desired Future State

[Where do we want to be? What does success look like?]

## Success Criteria

[How will we know we've succeeded?]

- [ ] [Measurable criterion 1]
- [ ] [Measurable criterion 2]
- [ ] [Measurable criterion 3]

## Alternatives Considered

### Option A: [Name]
- Description: [Brief explanation]
- Pros: [Benefits]
- Cons: [Drawbacks]

### Option B: [Name]
- Description: [Brief explanation]
- Pros: [Benefits]
- Cons: [Drawbacks]

### Recommendation
[Which option and why]

## Constraints

### Non-Negotiables
- [Must have / cannot change]

### Resources
- [Time, budget, people available]

### Technical
- [System limitations, dependencies]

### Business
- [Regulatory, contractual, strategic]

## Scope

**In Scope:**
- [What this vision covers]

**Out of Scope:**
- [What this vision explicitly excludes]

## Open Questions

- [Unresolved questions that need answers]

## Next Steps

- [ ] [Immediate next action]
- [ ] [Following action]
```

---

## Discovery Process

### Approach: Discovery, Not Checklist

Don't mechanically fill in a form. Instead:

1. **Start with what's known**
   - What prompted this initiative?
   - What's the pain or opportunity?

2. **Discover gaps through questions**
   - What's unclear?
   - What assumptions are being made?
   - What would change the direction?

3. **Ask the founder/stakeholder**
   - Surface questions naturally
   - Capture answers in the appropriate section

### Key Discovery Questions

**Problem Discovery:**
- "What triggered this now?"
- "Who experiences this problem?"
- "How are they solving it today?"
- "What happens if we don't address this?"

**Success Discovery:**
- "How would we know this succeeded?"
- "What would make this a failure?"
- "What's the minimum viable success?"

**Constraint Discovery:**
- "What can't change?"
- "What resources are available?"
- "When does this need to be done?"
- "What decisions do you want to make personally?"

---

## Vision Quality Checklist

Before finalizing:

- [ ] TLDR captures essence in 2-4 sentences
- [ ] Problem is specific, not vague
- [ ] Severity is qualified (ideally quantified)
- [ ] Success criteria are measurable
- [ ] At least 2 alternatives considered
- [ ] Constraints are explicit
- [ ] Scope is clear (in and out)
- [ ] Open questions are surfaced

---

## Output Location

```
projects/{project}/docs/vision.md
```

Or for company-level:
```
company/docs/vision.md
```

---

## Integration

### With product-development-flow.md
- Vision is the first stage
- All other stages depend on vision existing
- Vision document is referenced throughout

### With project-kickoff.md
- Kickoff interview produces vision inputs
- Vision skill structures the outputs

### With brainstorm.md
- Vision anchors brainstorming
- Brainstorm explores options within vision constraints

### With prd.md
- PRD references vision for context
- PRD elaborates on chosen alternative

---

## Anti-Patterns

- **Solution masquerading as vision** - Start with problem, not solution
- **Vague success** - "Make it better" isn't measurable
- **Missing constraints** - Constraints shape solutions
- **Single option** - Always consider alternatives
- **Feature list** - Vision is about outcomes, not features
- **Skipping severity** - Pain level affects priority
