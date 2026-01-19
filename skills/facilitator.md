---
name: "Facilitator"
description: "Coordinate multi-agent discussions to reach decisions. Use when 5+ agents deliberate or for board meetings."
---

# Facilitator

Coordinate multi-agent deliberations to reach informed decisions.

## When to Use

- 5+ agents need to discuss a topic
- Board meetings requiring coordination
- Hub agents synthesizing multiple consultant opinions
- Any multi-agent deliberation requiring structure

## Dependencies

- **thinking.md** - For devil's advocate behavior during facilitation
- **decision-making.md** - For final decision evaluation
- **memory.md** - For documenting meeting outcomes

## Book Triggers

Reference: [[books/leadership-management.md]]
- Apply "High Output Management" meeting principles
- Use "Manager's Path" for decision-making authority

Reference: [[books/thinking-rationality.md]]
- Apply "Scout Mindset" truth-seeking to facilitation
- Use "Black Swan" awareness for hidden risks

---

## Facilitation Protocol

### Phase 1: Setup

1. **Define the question clearly**
   - What specific decision needs to be made?
   - What constraints exist?
   - What's the deadline for decision?

2. **Identify participants**
   - Which agents have relevant expertise?
   - Who has decision authority?
   - Who might offer contrarian perspectives?

3. **Set round limits**
   - Default: 3 rounds of deliberation
   - Maximum: 5 rounds (prevents infinite loops)
   - Facilitator can call early if consensus reached

### Phase 2: Initial Positions

Collect each participant's initial position:

```markdown
## [Agent Name] - Initial Position

**Recommendation:** [Their recommendation]
**Reasoning:** [Why they recommend this]
**Key Concerns:** [What worries them about alternatives]
**Confidence:** High/Medium/Low
```

### Phase 3: Structured Debate Rounds

For each round:

1. **Surface disagreements**
   - Identify where agents disagree
   - Clarify if disagreement is about facts or values

2. **Facilitate responses**
   - Disagreeing agents respond to each other via sub-agent calls
   - Each response must address the specific counter-argument

3. **Inject contrarian perspectives**
   - If consensus forming too quickly, raise opposing view
   - Apply devil's advocate behavior from thinking.md
   - Ask: "What would make this fail?"

4. **Track movement**
   - Note any position changes
   - Identify unresolved disagreements

### Phase 4: Synthesis

After rounds complete:

1. **Map the landscape**
   - Where is there agreement?
   - Where do disagreements remain?
   - What are the key tradeoffs?

2. **Evaluate using decision-making.md**
   - Apply Tier 0 principles
   - Assess reversibility, risk, opportunity cost

3. **Make the call**
   - Facilitator (or designated authority) decides
   - Must address all dissenting positions
   - Document reasoning explicitly

---

## Output Format: Meeting Notes

Document every facilitated discussion:

```markdown
# [Meeting Type]: [Topic]

**Date:** YYYY-MM-DD
**Facilitator:** [Agent name or Co-founder]
**Participants:** [List of agents]

## Question
[The specific question being decided]

## Initial Positions

### [Agent 1]
- Position: [summary]
- Key argument: [main point]

### [Agent 2]
- Position: [summary]
- Key argument: [main point]

## Deliberation Summary

### Round 1
- [Key exchanges]
- [Position shifts]

### Round 2
- [Key exchanges]
- [New information surfaced]

## Areas of Agreement
- [Consensus points]

## Unresolved Disagreements
- [Remaining tensions]
- [Why they couldn't be resolved]

## Decision
**Chosen:** [The decision]
**Reasoning:** [Why this was chosen]
**Dissent addressed:** [How opposing views were considered]

## Action Items
- [ ] [Specific action] - Owner: [Agent]
- [ ] [Another action] - Owner: [Agent]

## Review Trigger
[When/what would cause us to revisit this decision]
```

---

## Contrarian Injection Protocol

### When to Inject

- Consensus reached in first round (too fast)
- All participants from same department
- High-stakes decision with low apparent disagreement
- No one has mentioned failure modes

### How to Inject

1. **Steelman the opposition**
   ```
   "Before we finalize, let me present the strongest case against this..."
   ```

2. **Pre-mortem prompt**
   ```
   "Imagine it's 6 months from now and this failed. What went wrong?"
   ```

3. **Hidden assumption probe**
   ```
   "This assumes [X]. What if [X] isn't true?"
   ```

4. **External perspective**
   ```
   "How would [competitor/skeptic/customer] view this?"
   ```

---

## Round Limits by Decision Type

| Decision Type | Max Rounds | Notes |
|---------------|------------|-------|
| Tactical (reversible) | 2 | Speed matters more |
| Strategic (one-way door) | 5 | Thoroughness matters more |
| Board decisions | 4 | Balance of both |
| Time-sensitive | 2 | Acknowledge tradeoff |

---

## Integration

### With Board Chairman
- `board-chairman.md` uses this skill for board meetings
- Chairman has authority to override round limits for critical decisions
- Board meetings always get meeting notes

### With Hub Agents
- `hub-consultancy.md` uses this skill when multiple consultants weigh in
- Hub synthesizes consultant positions before presenting to requester

### With Decision Documentation
- All facilitated decisions go to `projects/{project}/decisions/`
- Or `company/decisions/` for company-wide decisions

---

## Anti-Patterns

- **Consensus without conflict** - Real deliberation surfaces disagreement
- **Facilitator taking sides** - Stay neutral until final synthesis
- **Skipping devil's advocate** - Always inject contrarian view on important decisions
- **Undocumented decisions** - Every facilitated discussion gets meeting notes
- **Infinite rounds** - Enforce round limits; indecision is a decision
