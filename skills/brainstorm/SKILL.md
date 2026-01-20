---
name: "Brainstorm"
description: "Facilitate ideation sessions to explore options. Use when exploring solutions before committing to a direction."
---

# Brainstorm

Facilitate structured ideation to explore options before commitment.

## When to Use

- After vision is established, before PRD
- When multiple approaches seem viable
- When creative exploration is needed
- When stakeholders need to align on direction

## Dependencies

- **vision.md** - Vision document must exist
  - Check: `projects/{project}/docs/vision.md`

## Book Triggers

Reference: [[books/thinking-rationality.md]]
- Apply "Scout Mindset" to explore genuinely, not confirm
- Use divergent-then-convergent thinking

Reference: [[books/product-innovation.md]]
- Apply "Inspired" discovery techniques

---

## Brainstorming Protocol

### Phase 1: Divergent (Generate)

**Goal:** Maximize option generation without judgment.

1. **Set the frame**
   - Reference the vision document
   - State the specific question being explored
   - Set time limit for generation phase

2. **Generate options**
   - Quantity over quality initially
   - No criticism of ideas
   - Build on others' ideas
   - Include "crazy" ideas

3. **Capture everything**
   - List all ideas without filtering
   - Note who suggested what (if multi-agent)

### Phase 2: Convergent (Evaluate)

**Goal:** Narrow to viable options.

1. **Group similar ideas**
   - Cluster related approaches
   - Name each cluster

2. **Initial filter**
   - Does it address the vision's problem?
   - Is it feasible given constraints?
   - Remove obviously non-viable options

3. **Deep evaluation**
   - Apply decision-making skill
   - Consider tradeoffs
   - Assess against success criteria

### Phase 3: Synthesis

**Goal:** Arrive at recommendation.

1. **Shortlist** (2-4 options)
2. **Compare systematically**
3. **Recommend with rationale**
4. **Document dissent**

---

## Brainstorm Output Template

```markdown
# Brainstorm: [Topic]

## TLDR

[2-3 sentences: What we explored, what emerged as the leading direction, and why.]

## Context

**Vision:** [Link to vision doc]
**Question:** [Specific question being explored]
**Participants:** [Who participated]

## Ideas Generated

### Category A: [Name]
- Idea 1
- Idea 2
- Idea 3

### Category B: [Name]
- Idea 4
- Idea 5

### Category C: [Name]
- Idea 6
- Idea 7

## Evaluation

### Shortlisted Options

#### Option 1: [Name]
- **Description:** [What it is]
- **Pros:** [Benefits]
- **Cons:** [Drawbacks]
- **Fit with vision:** [How well does it address the problem?]

#### Option 2: [Name]
- **Description:** [What it is]
- **Pros:** [Benefits]
- **Cons:** [Drawbacks]
- **Fit with vision:** [How well does it address the problem?]

### Comparison Matrix

| Criterion | Option 1 | Option 2 |
|-----------|----------|----------|
| Addresses problem | | |
| Feasibility | | |
| Time to value | | |
| Risk | | |

## Recommendation

**Recommended:** [Option name]
**Rationale:** [Why this option]

## Dissent

[Any disagreements or concerns about the recommendation]

## Next Steps

- [ ] Create PRD for recommended option
- [ ] [Other follow-up actions]
```

---

## Output Location

```
projects/{project}/docs/brainstorm.md
```

Or for specific feature:
```
projects/{project}/docs/brainstorm-{feature}.md
```

---

## Multi-Agent Brainstorming

When involving multiple agents:

1. **Use facilitator skill**
   - Coordinate the session
   - Ensure all perspectives heard

2. **Assign perspectives**
   - Technical feasibility (CTO/Architect)
   - User value (Product)
   - Business impact (CMO/CEO)
   - Risk (Conservative board member)

3. **Structured rounds**
   - Round 1: Generate from your perspective
   - Round 2: React to others' ideas
   - Round 3: Synthesize and recommend

---

## Quality Checklist

- [ ] Vision document referenced
- [ ] Multiple categories of ideas generated
- [ ] At least 2 options shortlisted
- [ ] Tradeoffs explicitly compared
- [ ] Recommendation has clear rationale
- [ ] Dissent documented if any

---

## Anti-Patterns

- **Premature convergence** - Evaluating too early kills creativity
- **Single option** - Always explore alternatives
- **Confirmation bias** - Genuinely consider all options
- **Ignoring constraints** - Ideas must be feasible
- **Missing dissent** - Capture disagreements for record
