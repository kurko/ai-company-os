---
name: "Decision Making"
description: "Apply Tier 0 axioms to evaluate decisions. Use when making choices, assessing risk, or prioritizing work."
---

# Decision Making

Apply Tier 0 axioms to evaluate decisions and recommendations.

## When to Use

- Before making significant choices
- When evaluating options or recommendations
- When assessing risk
- When prioritizing work

## Book Triggers

Reference: [[books/thinking-rationality.md]]
- Apply "Black Swan" fat-tail thinking to risk assessment
- Use "Scout Mindset" for truth-seeking over confirmation
- Apply "Thinking in Systems" for feedback loop analysis

Reference: [[books/systems-thinking.md]]
- Use "Product Development Flow" for opportunity cost and queue theory

## Decision Framework

### Step 1: First Principles Decomposition

Before evaluating options, decompose the problem:

1. What are we actually trying to achieve? (Not the solution, the goal)
2. What constraints are truly fixed vs assumed?
3. What would we do if starting from scratch?

### Step 2: Falsification Check

For each option, actively seek disconfirmation:

- What evidence would prove this wrong?
- What are we assuming that might not be true?
- Pre-mortem: It's 6 months later and this failed. Why?

### Step 3: Risk Assessment Matrix

Evaluate using these lenses:

| Factor | Question |
|--------|----------|
| **Reversibility** | Two-way door (fast) or one-way door (analyze)? |
| **Via Negativa** | What would make this fail? |
| **Margin of Safety** | If estimates are 2x wrong, does it still work? |
| **Second Order** | What are the consequences of the consequences? |
| **Antifragility** | Does this strengthen under stress or break? |

### Step 4: Opportunity Cost

Explicitly name what you're NOT doing by choosing this path:

- What resources get allocated here?
- What alternatives become impossible?
- Is this the highest-leverage use of effort?

### Step 5: Pareto Filter

Apply 80/20 thinking:

- Which 20% of this delivers 80% of value?
- What can be cut without meaningful impact?
- What's the minimum viable version?

## Output Format

When documenting decisions, use this structure:

```markdown
## Decision: [Title]

**Date:** YYYY-MM-DD
**Status:** Proposed | Approved | Rejected

### Context
What situation prompted this decision?

### Options Considered
1. Option A - [brief description]
2. Option B - [brief description]

### Analysis

#### First Principles
[Decomposition of the actual goal]

#### Risk Assessment
- Reversibility: [two-way/one-way]
- Via Negativa: [failure modes]
- Margin of Safety: [buffer assessment]
- Second Order: [downstream effects]

#### Opportunity Cost
[What we're giving up]

### Decision
[The choice made and why]

### Review Trigger
[When/what would cause us to revisit this]
```

## Anti-Patterns

Avoid these decision-making failures:

- **Confirmation bias**: Seeking evidence that supports preferred option
- **Sunk cost fallacy**: Continuing because of past investment
- **Availability heuristic**: Overweighting recent or vivid examples
- **Anchoring**: Over-relying on first piece of information
- **Groupthink**: Consensus without genuine dissent

## Integration

This skill is foundational. Other skills should invoke decision-making when:

- Choosing between implementation approaches
- Prioritizing backlog items
- Evaluating feature requests
- Assessing technical debt tradeoffs

See `company/docs/decision-principles.md` for the Tier 0 axioms reference.
