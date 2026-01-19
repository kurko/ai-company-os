---
name: "Research"
description: "Research markets, competitors, or people for agent creation. Use when needing external information with verified sources."
---

# Research

Conduct verified research with dual-verification to reduce hallucination.

## When to Use

- Market analysis and competitor research
- User needs and sentiment analysis
- Best practices and industry standards
- Meta research for consultant agent creation (researching public figures)
- Any task requiring external information with citations

## Dependencies

- **thinking.md** - For analyzing research findings
- **writing-documents.md** - For formatting research outputs

## Book Triggers

Reference: [[books/thinking-rationality.md]]
- Apply "Scout Mindset" truth-seeking to research
- Use "Black Swan" awareness for information asymmetry

---

## Research Modes

### Mode 1: Project Research

Research related to the product/project:

- **Market analysis** - Size, trends, dynamics
- **Competitor research** - Who's in the space, their approaches
- **User needs** - What users want, pain points
- **Best practices** - Industry standards, proven patterns
- **Technical research** - Documentation, libraries, tools

### Mode 2: Meta Research

Research for creating consultant agents:

- **Public figures** - Their talks, books, methodologies
- **Expert opinions** - Published positions on topics
- **Frameworks** - Specific tools and approaches they use
- **Sources** - Books, talks, articles to cite

**IMPORTANT:** Meta research requires extra rigor. Consultant agents must represent real positions, not hallucinated ones.

---

## Dual Verification Pattern

To reduce hallucination, research is conducted **twice** with independent sub-agents:

```
Research Request
      |
      v
+-----+-----+
|           |
v           v
Sub-Agent A   Sub-Agent B
(Research)    (Research)
|           |
v           v
Results A    Results B
      |
      v
Compare for Divergence
      |
      +---> If aligned: Synthesize and return
      |
      +---> If divergent: Third sub-agent tiebreaker
                |
                v
         Final synthesis with noted disagreements
```

### Sub-Agent Instructions

Each research sub-agent receives:
- The specific research question
- Required output format
- Instruction to cite sources with URLs
- No access to the other sub-agent's findings

### Divergence Handling

| Divergence Level | Action |
|------------------|--------|
| Low (findings align) | Synthesize both into unified output |
| Medium (partial overlap) | Note areas of agreement and disagreement |
| High (contradictory) | Invoke third sub-agent tiebreaker |

---

## Research Depth Levels

The requesting agent specifies depth:

### Quick Lookup
- Single-pass research
- Basic facts and overview
- 1-2 sources sufficient
- Use for: known facts, quick verification

### Standard Research
- Dual verification pattern
- Multiple sources required
- Moderate depth analysis
- Use for: most research needs

### Deep Dive
- Extended research with multiple angles
- Comprehensive source gathering
- Full divergence checking
- Use for: major decisions, consultant creation, critical market analysis

---

## Output Format

```markdown
## Research: [Topic]

**Mode:** Project / Meta
**Depth:** Quick / Standard / Deep
**Date:** YYYY-MM-DD

### TLDR

[2-3 sentence summary of key findings]

### Key Findings

1. **[Finding 1]**
   [Details]
   Source: [URL or citation]

2. **[Finding 2]**
   [Details]
   Source: [URL or citation]

### Verification Notes

- Sub-agent alignment: High / Medium / Low
- Areas of agreement: [list]
- Areas of disagreement: [list if any]
- Tiebreaker needed: Yes / No

### Gaps and Uncertainties

- [What couldn't be verified]
- [Areas needing more research]

### Sources

1. [Source 1 with URL]
2. [Source 2 with URL]
3. [Source 3 with URL]
```

---

## Meta Research: Consultant Creation

When researching a public figure for consultant agent creation:

### Required Information

- **Background**: Career, known for, key works
- **Core principles**: Verified positions with sources
- **Methodologies**: Specific frameworks they use
- **Questions they ask**: Characteristic inquiry patterns
- **Books/talks**: Primary sources

### Verification Standard

For consultant agents, **every principle must have a source**:

```markdown
### Key Principles

1. **[Principle]**
   - Description: [what it means]
   - Source: [Book title, p. XX] or [Talk name, timestamp]
   - Verification: Confirmed by both sub-agents
```

### What to Avoid

- Assuming positions they haven't stated
- Extrapolating from general knowledge
- Mixing up different people's ideas
- Including unverified "common knowledge"

---

## Integration

### Any Agent Can Use Research

- **Engineers** research documentation, libraries
- **CMO** researches marketing practices
- **Product** researches competitors, users
- **AR Director** researches people for consultant creation

### Self-Initiated

Agents decide when research is needed. Research happens when:
- Explicit request from another agent
- Self-identified knowledge gap
- Major decision requiring external data

### With create-agent.md

For consultant creation:
```
1. AR Director identifies need for consultant
2. Invoke research skill in Meta mode, Deep depth
3. Dual verification produces verified findings
4. Use findings to populate consultant template
5. Every principle traces to research source
```

---

## Quality Checklist

Before completing research:

- [ ] TLDR captures key findings
- [ ] All findings have sources with URLs
- [ ] Dual verification completed (for Standard/Deep)
- [ ] Divergence noted if any
- [ ] Gaps and uncertainties explicit
- [ ] Depth matches request importance

---

## Anti-Patterns

- **Single-source reliance** - Always seek multiple sources
- **Uncited findings** - Every claim needs a source
- **Skipping verification** - Dual pattern exists to catch errors
- **Assumed knowledge** - Verify even "obvious" facts for consultants
- **Confirmation bias** - Seek disconfirming information too
- **Shallow meta research** - Consultant creation requires Deep depth
