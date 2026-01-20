---
name: "Thinking"
description: "Decompose complex problems with structured reasoning. Use for ambiguous problems, exploring perspectives, or reducing bias."
---

# Thinking

Complex problem decomposition and structured reasoning with bias isolation.

## When to Use

- Facing complex or ambiguous problems
- Need to explore multiple perspectives
- Risk of confirmation bias in current thinking
- Evaluating ideas before commitment

## Book Triggers

Reference: [[books/thinking-rationality.md]]
- Apply "Scout Mindset" truth-seeking orientation
- Use "Black Swan" awareness of unknown unknowns

Reference: [[books/systems-thinking.md]]
- Apply "Thinking in Systems" for feedback loops and leverage points
- Use "Product Development Flow" for variability and batching insights

## Core Patterns

### 1. Problem Decomposition

Break complex problems into tractable pieces:

```
1. State the problem in one sentence
2. List what you know (facts)
3. List what you assume (hypotheses)
4. List what you don't know (gaps)
5. Identify the smallest piece you can validate
```

**Output format:**
```markdown
## Problem: [One sentence]

### Known Facts
- [Verified information]

### Assumptions
- [Hypothesis] - Confidence: High/Medium/Low

### Unknown
- [Gap] - Impact if wrong: High/Medium/Low

### First Step
[Smallest validatable piece]
```

### 2. Sub-Agent Thinking Pattern

When exploring ideas, spawn ephemeral sub-agents as "ideas in the brain":

**Why:** Isolation prevents context pollution. Each sub-agent explores independently, reducing hallucination and anchoring bias.

**When to spawn sub-agents:**
- Evaluating multiple competing approaches
- Need truly independent perspectives
- Complex analysis that might bias subsequent thinking
- Research requiring fresh context

**Pattern:**
```
1. Define the specific question for the sub-agent
2. Provide minimal context (avoid leading)
3. Let sub-agent explore independently
4. Collect conclusion without full context transfer
5. Synthesize across sub-agent outputs
```

### 3. Devil's Advocate Behavior

**Built into this skill** - not just the external consultant agent.

When evaluating any significant idea or decision:

1. **Steelman the opposition**: What's the strongest argument AGAINST?
2. **Assume it fails**: Pre-mortem - why did this fail?
3. **Find the hidden assumption**: What must be true for this to work?
4. **Seek disconfirmation**: What evidence would prove this wrong?

**Trigger automatically when:**
- Confidence is high (overconfidence risk)
- Consensus emerged quickly (groupthink risk)
- Solution seems obvious (complexity hiding risk)

**Output format:**
```markdown
## Devil's Advocate Analysis

### Strongest Counter-Argument
[Steelmanned opposition]

### Pre-Mortem: Why This Failed
[Failure narrative from the future]

### Hidden Assumptions
- [Assumption that must hold]
- [Another assumption]

### Disconfirming Evidence to Seek
- [What would prove this wrong]
```

### 4. Perspective Rotation

Deliberately view the problem from different angles:

| Perspective | Question |
|-------------|----------|
| **User** | What does the person using this actually need? |
| **Operator** | What does the person maintaining this need? |
| **Skeptic** | Why is this a bad idea? |
| **Optimist** | What's the best case scenario? |
| **Historian** | What happened when others tried this? |
| **Future Self** | Will I regret this in 6 months? |

### 5. Uncertainty Tracking

Maintain explicit uncertainty throughout analysis:

**Confidence levels:**
- **High**: Multiple independent confirmations
- **Medium**: Single source or reasonable inference
- **Low**: Assumption or limited data
- **Unknown**: Haven't investigated

**Always surface:**
- What would change your confidence?
- What's the cost of being wrong?
- Is more investigation worth the delay?

## Integration with Other Skills

### With decision-making.md
After thinking through a problem, invoke decision-making for the final evaluation:
```
thinking.md -> problem decomposition -> options identified
decision-making.md -> evaluate options -> choose
```

### With research.md
When gaps are identified, invoke research:
```
thinking.md -> identifies unknowns
research.md -> fills gaps (dual verification)
thinking.md -> incorporates findings
```

## Anti-Patterns

- **Analysis paralysis**: Thinking without action threshold
- **Premature convergence**: Stopping exploration too early
- **Confirmation search**: Looking for evidence that supports preferred conclusion
- **Complexity worship**: Making simple problems complicated
- **Solo thinking on high-stakes**: Not invoking devil's advocate on important decisions

## Output Checklist

Before concluding any significant thinking process:

- [ ] Problem clearly stated
- [ ] Assumptions surfaced and confidence-rated
- [ ] Devil's advocate perspective included
- [ ] Unknowns identified with impact assessment
- [ ] At least one disconfirming scenario considered
- [ ] Next action is specific and actionable
