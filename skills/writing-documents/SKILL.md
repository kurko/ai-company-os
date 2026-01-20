---
name: "Writing Documents"
description: "Structure documents with TLDR-first format. Use when creating any document, PRD, vision doc, or decision record."
---

# Writing Documents

Standard structure and formatting for all documents produced by agents.

## When to Use

- Creating any document artifact (vision, PRD, decision record)
- Writing meeting notes or session recaps
- Producing any output meant to be read by others
- Reviewing documents for structural quality

## Dependencies

- None - this is a core skill

## Book Triggers

Reference: [[books/personal-effectiveness.md]]
- Apply "Made to Stick" principles for memorable communication
- Use pyramid principle for logical structure

---

## Core Principle: TLDR First

**Every document starts with a TLDR (Too Long; Didn't Read).**

Why:
- Readers can decide whether to continue
- Forces writer to clarify the core message
- Enables quick scanning in context-constrained environments
- Respects reader's time and attention

---

## Document Structure Template

```markdown
# [Document Title]

## TLDR

[2-4 sentences capturing the essence. If someone reads ONLY this, they should understand the key point, decision, or recommendation.]

## Context

[Why this document exists. What situation prompted it.]

## [Main Content Sections]

[The body of the document, organized logically.]

## Open Questions

[Unresolved issues that need future attention.]

## Next Steps

[Concrete actions with owners if applicable.]
```

---

## Section Guidelines

### TLDR

- 2-4 sentences maximum
- State the conclusion/recommendation/decision first
- Include the "so what" - why it matters
- Standalone readable - no references to "below" or "as discussed"

**Good TLDR:**
> We should proceed with Option B (microservices architecture) because it allows independent scaling and team autonomy. This requires 6 weeks of setup before feature work can begin. The main risk is operational complexity.

**Bad TLDR:**
> This document discusses options for our architecture. See below for analysis.

### Context

- Brief background (3-5 sentences)
- What triggered this document
- Who needs to know this
- Links to related documents if relevant

### Main Content

- Use paragraphs for narrative explanation
- Use bullet points for lists of items
- Use tables for comparison or structured data
- Use headers to create scannable structure

### Open Questions

- Explicit list of unresolved issues
- Each question should be specific and answerable
- Note any dependencies or blockers

### Next Steps

- Concrete and actionable
- Include owner/responsible party
- Include timeline if known

---

## Formatting Standards

### Headers

- Use proper hierarchy (# > ## > ###)
- Don't skip levels (no # followed by ###)
- Headers should be descriptive, not generic

### Lists

- Use bullets (-) for unordered items
- Use numbers (1.) for sequential steps
- Keep parallel structure within lists
- Indent sub-items consistently

### Emphasis

- **Bold** for key terms or important points
- *Italics* for book titles or emphasis
- `Code` for technical terms, filenames, commands
- > Blockquotes for quotations or callouts

### Tables

Use for:
- Comparisons (Option A vs Option B)
- Structured reference data
- Matrices (effort vs impact)

```markdown
| Column A | Column B | Column C |
|----------|----------|----------|
| data     | data     | data     |
```

---

## Progressive Disclosure

Structure documents so readers can stop at any point with value:

1. **TLDR** - 10 seconds, get the core message
2. **Context + TLDR** - 30 seconds, understand why it matters
3. **Main sections skimmed** - 2 minutes, grasp the structure
4. **Full document** - 5+ minutes, complete understanding

Each level should provide complete (if shallow) understanding.

---

## Document Types Quick Reference

| Type | Key Sections | Primary Audience |
|------|--------------|------------------|
| Vision | TLDR, Problem, Solution, Success Criteria | All stakeholders |
| PRD | TLDR, User Stories, Requirements, Scope | Product + Engineering |
| Decision Record | TLDR, Options, Analysis, Decision | Future readers |
| Meeting Notes | TLDR, Discussion, Decisions, Actions | Participants + stakeholders |
| Session Recap | TLDR, Work Done, Questions, Next Session | Next session self |

---

## Quality Checklist

Before finalizing any document:

- [ ] TLDR present and standalone readable
- [ ] Context explains why this exists
- [ ] Headers create scannable structure
- [ ] Lists use parallel structure
- [ ] Open questions are explicit
- [ ] Next steps are actionable
- [ ] No orphaned references ("as mentioned above")
- [ ] Formatting is consistent

---

## Anti-Patterns

- **Burying the lede** - Important conclusion at the end
- **Wall of text** - No headers or structure
- **Context without conclusion** - All background, no recommendation
- **Generic headers** - "Discussion", "Analysis" without specifics
- **Unresolved ambiguity** - Questions hidden in prose, not surfaced
- **Missing audience** - Writing for self instead of reader
