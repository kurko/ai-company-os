---
name: "PRD"
description: "Create Product Requirements Documents. Use when defining requirements for a feature or product."
---

# PRD

Create Product Requirements Documents that translate vision into actionable requirements.

## When to Use

- After vision is established
- When defining a feature for implementation
- When requirements need formal documentation
- Before breaking work into user stories

## Dependencies

- **vision.md** - Vision document must exist
  - Check: `projects/{project}/docs/vision.md`

## Book Triggers

Reference: [[books/product-innovation.md]]
- Apply "Inspired" PRD principles
- Use "Escaping the Build Trap" outcome focus

Reference: [[books/software-craft.md]]
- Apply "User Story Mapping" for requirements structure

---

## PRD Template

```markdown
# PRD: [Feature Name]

## TLDR

[2-4 sentences: What we're building, why, and what success looks like.]

## Context

**Vision:** [Link to vision doc]
**Author:** [Who wrote this]
**Status:** Draft | In Review | Approved
**Last Updated:** YYYY-MM-DD

## Problem Statement

[What problem does this solve? Who has this problem?]

## Goals

### Primary Goal
[The main outcome we're seeking]

### Secondary Goals
- [Additional outcomes]

### Non-Goals
- [What this explicitly does NOT aim to achieve]

## User Stories

### [User Type 1]

**As a** [user type]
**I want to** [action]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

### [User Type 2]

**As a** [user type]
**I want to** [action]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

## Requirements

### Functional Requirements

| ID | Requirement | Priority | Notes |
|----|-------------|----------|-------|
| FR1 | [Requirement] | Must | |
| FR2 | [Requirement] | Should | |
| FR3 | [Requirement] | Could | |

### Non-Functional Requirements

| ID | Requirement | Target | Notes |
|----|-------------|--------|-------|
| NFR1 | Performance | [metric] | |
| NFR2 | Security | [standard] | |
| NFR3 | Accessibility | [level] | |

## Scope

### In Scope
- [What's included]

### Out of Scope
- [What's explicitly excluded]

### Future Considerations
- [Things to consider later]

## Design

### User Flow
[Describe or link to user flow]

### Mockups
[Link to designs if available]

### Technical Considerations
[Any technical constraints or decisions]

## Success Metrics

| Metric | Current | Target | How Measured |
|--------|---------|--------|--------------|
| [Metric 1] | [baseline] | [goal] | [method] |
| [Metric 2] | [baseline] | [goal] | [method] |

## Risks and Mitigations

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| [Risk 1] | High/Med/Low | High/Med/Low | [Plan] |
| [Risk 2] | High/Med/Low | High/Med/Low | [Plan] |

## Dependencies

- [External dependency 1]
- [Technical dependency 2]

## Timeline

| Milestone | Target Date | Notes |
|-----------|-------------|-------|
| PRD Approved | | |
| Design Complete | | |
| Development Start | | |
| Testing Complete | | |
| Launch | | |

## Open Questions

- [ ] [Question needing answer]
- [ ] [Another question]

## Appendix

[Additional details, research, or references]
```

---

## Output Location

```
projects/{project}/docs/prd/{feature-name}.md
```

---

## PRD Quality Levels

### Lightweight PRD
For small features:
- TLDR
- Problem Statement
- User Stories with Acceptance Criteria
- Scope

### Standard PRD
For medium features:
- Full template
- Skip optional sections if not relevant

### Comprehensive PRD
For major features/products:
- Full template
- Detailed requirements tables
- Risk analysis
- Timeline with dependencies

---

## Scoping Process

### Apply Appetite-Based Scoping (Shape Up)

1. **Set appetite**
   - How much time/effort is this worth?
   - Small batch (1-2 weeks) vs big batch (6 weeks)

2. **Shape to fit**
   - What can we deliver within appetite?
   - What must be cut?

3. **Document fixed vs variable**
   - Fixed: deadline, team size
   - Variable: scope

### MoSCoW Prioritization

- **Must** - Required for launch
- **Should** - Important but not critical
- **Could** - Nice to have
- **Won't** - Explicitly excluded (this time)

---

## PRD Review Checklist

- [ ] Links to vision document
- [ ] Problem clearly stated
- [ ] User stories have acceptance criteria
- [ ] Scope is explicit (in and out)
- [ ] Success metrics are measurable
- [ ] Risks identified with mitigations
- [ ] Open questions surfaced

---

## Integration

### With vision.md
- PRD references and builds on vision
- Vision's success criteria become PRD's goals

### With user-stories.md
- User stories in PRD get broken down further
- Each story becomes trackable work

### With engineering
- PRD is the contract for what to build
- Acceptance criteria define "done"

---

## Anti-Patterns

- **Solution without problem** - Always start with why
- **Vague acceptance criteria** - Must be testable
- **Scope creep** - Document what's out
- **Missing metrics** - How do we know it worked?
- **No risks** - Every project has risks
- **PRD as spec** - PRD is "what", not "how"
