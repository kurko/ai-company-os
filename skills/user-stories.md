---
name: "User Stories"
description: "Break PRDs into user stories with acceptance criteria. Use when preparing work for development."
---

# User Stories

Break requirements into implementable user stories with clear acceptance criteria.

## When to Use

- After PRD is approved
- When preparing work for sprint/cycle
- When requirements need further breakdown
- Before creating backlog tasks

## Dependencies

- **prd.md** - PRD must exist
  - Check: `projects/{project}/docs/prd/{feature}.md`

## Book Triggers

Reference: [[books/software-craft.md]]
- Apply "User Story Mapping" techniques
- Use INVEST criteria for story quality

Reference: [[books/product-innovation.md]]
- Apply "Inspired" user story principles

---

## User Story Format

### Standard Format

```
As a [user type]
I want to [action]
So that [benefit]
```

### With Acceptance Criteria

```markdown
### [Story Title]

**As a** [user type]
**I want to** [action]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] Given [context], when [action], then [result]
- [ ] Given [context], when [action], then [result]
- [ ] [Additional criterion]

**Notes:**
[Any additional context or constraints]
```

---

## INVEST Criteria

Every story should be:

| Criterion | Question | Bad Example | Good Example |
|-----------|----------|-------------|--------------|
| **I**ndependent | Can it be built alone? | "After login is done..." | Self-contained story |
| **N**egotiable | Is scope flexible? | Fixed implementation | Outcome-focused |
| **V**aluable | Does it deliver value? | "Refactor database" | User-facing benefit |
| **E**stimable | Can we size it? | "Improve performance" | Specific, bounded |
| **S**mall | Fits in one sprint? | Multi-month epic | 1-5 day story |
| **T**estable | Can we verify done? | "Make it better" | Clear acceptance criteria |

---

## Breaking Down Stories

### From PRD to Stories

1. **Identify user types**
   - Who interacts with this feature?
   - What are their distinct needs?

2. **Map user journeys**
   - What steps does each user take?
   - Each step may be a story

3. **Apply INVEST**
   - Is each story independent?
   - Is each story small enough?

4. **Add acceptance criteria**
   - How do we know it's done?
   - What are the edge cases?

### Story Splitting Techniques

When a story is too large:

| Technique | Example |
|-----------|---------|
| By user type | "Admin can..." vs "User can..." |
| By workflow step | "User starts..." then "User completes..." |
| By data variation | "With single item..." vs "With multiple items..." |
| By interface | "Via web..." vs "Via API..." |
| By operation | "Create..." then "Edit..." then "Delete..." |

---

## Acceptance Criteria Patterns

### Given-When-Then (BDD)

```
Given [precondition/context]
When [action is taken]
Then [expected result]
```

**Example:**
```
Given I am logged in as an admin
When I click "Delete User"
Then I see a confirmation dialog
And the user is not deleted until I confirm
```

### Checklist Style

```markdown
**Acceptance Criteria:**
- [ ] Form validates email format
- [ ] Error message appears below invalid field
- [ ] Submit button is disabled until all required fields are valid
- [ ] Success message appears after submission
```

### Rule-Based

```markdown
**Rules:**
- Password must be at least 8 characters
- Password must contain one uppercase letter
- Password must contain one number
- User sees specific error for each failed rule
```

---

## Story Output Template

```markdown
# User Stories: [Feature Name]

## Context

**PRD:** [Link to PRD]
**Epic:** [Parent epic if applicable]

## Stories

### US-001: [Story Title]

**As a** [user type]
**I want to** [action]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

**Size:** S / M / L
**Priority:** Must / Should / Could

---

### US-002: [Story Title]

**As a** [user type]
**I want to** [action]
**So that** [benefit]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Size:** S / M / L
**Priority:** Must / Should / Could

---

## Dependencies

[Story dependency map if applicable]

## Open Questions

- [ ] [Question about requirements]
```

---

## Quality Checklist

For each story:

- [ ] Follows "As a... I want... So that..." format
- [ ] Passes INVEST criteria
- [ ] Has 2-5 acceptance criteria
- [ ] Acceptance criteria are testable
- [ ] Sized appropriately (fits in sprint)
- [ ] Priority assigned

For the story set:

- [ ] Covers all PRD requirements
- [ ] No orphan stories (all map to PRD)
- [ ] Dependencies identified
- [ ] Stories are independent where possible

---

## Integration

### With prd.md
- Stories implement PRD requirements
- Each PRD requirement → one or more stories

### With backlog.md
- Stories become backlog items
- Prioritization happens at backlog level

### With engineering
- Stories are the unit of work
- Acceptance criteria define "done"

---

## Anti-Patterns

- **Technical stories** - "Refactor X" isn't a user story (make it a task)
- **Giant stories** - If it takes weeks, break it down
- **Missing criteria** - No acceptance criteria = undefined "done"
- **Vague criteria** - "Works correctly" isn't testable
- **Dependent stories** - Stories should be independent when possible
- **Solution in story** - "Using React" - story describes what, not how
