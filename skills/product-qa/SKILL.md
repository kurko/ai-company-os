---
name: "Product QA"
description: "Quality assurance for product delivery. Use when verifying features, creating test plans, or assessing release readiness."
---

# Product QA

Quality assurance methodology for ensuring products meet requirements before release.

## When to Use

- When a feature is approaching completion and needs QA verification
- When creating test plans for upcoming features
- When assessing if a release is ready to ship
- When defining acceptance criteria validation approaches
- When conducting regression testing after changes

## Dependencies

- **user-stories.md** - Acceptance criteria are the source of truth for verification
- **prd.md** - PRD defines the requirements being validated

## Book Triggers

Reference: [[books/software-craft.md]]
- Apply "Growing Object-Oriented Software" for test-first thinking at product level
- Apply testing pyramid concepts: fast unit tests, integration tests, slower E2E tests

Reference: [[books/product-innovation.md]]
- Apply "Escaping the Build Trap" - validate outcomes, not just outputs
- Apply "Inspired" for product discovery and validation methods

---

## QA Philosophy

### 1. Verification vs Validation

| Type | Question | Focus |
|------|----------|-------|
| **Verification** | Did we build it right? | Does implementation match spec |
| **Validation** | Did we build the right thing? | Does it solve the user problem |

QA covers both. Don't ship something that "works" but doesn't solve the problem.

### 2. Quality Gates Not Quality Control

Quality should be built in, not inspected in. QA is a gate that confirms quality exists, not a department that creates it.

- Developers own unit and integration tests
- QA owns acceptance and regression testing
- Product owns validation that it solves the problem

### 3. Risk-Based Testing

Not all features need the same testing depth. Allocate effort based on:

| Risk Factor | Higher Testing | Lower Testing |
|-------------|----------------|---------------|
| User impact | Many users affected | Few users |
| Data integrity | Writes/deletes data | Read-only |
| Complexity | Many edge cases | Simple logic |
| Reversibility | Hard to undo | Easy rollback |
| Dependencies | Many integrations | Isolated feature |

---

## Test Planning

### Test Plan Template

```markdown
## Test Plan: [Feature Name]

### Overview
- **PRD Reference**: [Link to PRD]
- **User Stories**: [List story IDs]
- **Risk Level**: Low / Medium / High
- **Testing Approach**: [Summary]

### Scope

**In Scope:**
- [Functionality to test]
- [Edge cases to cover]

**Out of Scope:**
- [What won't be tested and why]

### Test Cases

#### Happy Path
| ID | Scenario | Steps | Expected Result | Status |
|----|----------|-------|-----------------|--------|
| TC-01 | [Basic flow] | [Steps] | [Result] | |
| TC-02 | [Variant] | [Steps] | [Result] | |

#### Edge Cases
| ID | Scenario | Steps | Expected Result | Status |
|----|----------|-------|-----------------|--------|
| TC-10 | [Edge case] | [Steps] | [Result] | |

#### Error Handling
| ID | Scenario | Steps | Expected Result | Status |
|----|----------|-------|-----------------|--------|
| TC-20 | [Error condition] | [Steps] | [Result] | |

### Acceptance Criteria Mapping

| AC ID | Acceptance Criteria | Test Cases | Status |
|-------|--------------------|-----------:|--------|
| AC-1 | [From user story] | TC-01, TC-02 | |
| AC-2 | [From user story] | TC-10 | |

### Environment Requirements
- [Specific environment needs]
- [Test data requirements]
- [Integration dependencies]

### Risks and Mitigations
- [Testing risk]: [Mitigation]
```

---

## Acceptance Criteria Testing

### What Makes Good Acceptance Criteria Testable

From the user-stories skill, acceptance criteria must be:

- **Specific**: One behavior per criterion
- **Measurable**: Can objectively pass/fail
- **Independent**: Can test without other criteria

### Testing Approach per AC Type

| AC Pattern | Testing Approach |
|------------|------------------|
| "Given/When/Then" | Map directly to test case |
| "User can..." | Verify user journey end-to-end |
| "System must..." | Verify system behavior |
| "Performance: X in Y time" | Load test with measurement |

### Traceability

Every acceptance criterion must have at least one test case. Track coverage:

```markdown
## Acceptance Criteria Coverage

| Story | Total AC | Tested | Coverage |
|-------|----------|--------|----------|
| US-01 | 5 | 5 | 100% |
| US-02 | 3 | 3 | 100% |
| US-03 | 4 | 3 | 75% ⚠️ |
```

---

## Regression Testing

### When to Run Regression

- After any bug fix (verify fix doesn't break other things)
- Before major releases
- After infrastructure changes
- After dependency updates

### Regression Suite Management

Maintain a core regression suite covering:

1. **Critical paths**: User journeys that must never break
2. **Past bugs**: Test for every bug fixed (prevent regression)
3. **Integration points**: Where systems connect

### Regression Prioritization

Not everything can be tested every time. Prioritize:

| Priority | Include When |
|----------|--------------|
| P1 (Always) | Every release, critical paths |
| P2 (Major releases) | Monthly releases, broader coverage |
| P3 (Quarterly) | Full regression, edge cases |

---

## Release Readiness Assessment

### Release Checklist

```markdown
## Release Readiness: [Version/Feature]

### Quality Gates

- [ ] All acceptance criteria have passing tests
- [ ] No P1 (critical) bugs open
- [ ] No P2 (major) bugs open OR explicitly accepted by Product
- [ ] Regression suite passes
- [ ] Performance meets requirements
- [ ] Security review completed (if applicable)

### Test Summary

| Category | Total | Passed | Failed | Blocked |
|----------|-------|--------|--------|---------|
| Functional | | | | |
| Edge cases | | | | |
| Error handling | | | | |
| Regression | | | | |

### Known Issues

| ID | Severity | Description | Decision |
|----|----------|-------------|----------|
| | P3 | [Minor issue] | Ship with known issue |

### Sign-Off

- [ ] QA Lead: [Name] - Date:
- [ ] Product Manager: [Name] - Date:
- [ ] Engineering Lead: [Name] - Date:
```

### Go/No-Go Decision Framework

| Condition | Decision |
|-----------|----------|
| All P1/P2 bugs resolved, all AC tested | GO |
| P2 bugs exist, Product accepts risk | GO with documented exceptions |
| P1 bugs exist | NO-GO until resolved |
| AC not fully tested | NO-GO until coverage complete |

---

## Bug Reporting

### Bug Report Template

```markdown
## Bug: [Brief Description]

**Severity**: P1 (Critical) / P2 (Major) / P3 (Minor) / P4 (Trivial)
**Found in**: [Version/Environment]
**Related to**: [Story/Feature]

### Summary
[One sentence description]

### Steps to Reproduce
1. [Step 1]
2. [Step 2]
3. [Step 3]

### Expected Result
[What should happen]

### Actual Result
[What actually happens]

### Evidence
[Screenshots, logs, error messages]

### Environment
- Browser/Device:
- OS:
- User role:
- Test data:
```

### Severity Definitions

| Severity | Definition | Response |
|----------|------------|----------|
| P1 (Critical) | System unusable, data loss, security breach | Fix immediately, block release |
| P2 (Major) | Major feature broken, no workaround | Fix before release |
| P3 (Minor) | Feature partially broken, workaround exists | Fix if time permits |
| P4 (Trivial) | Cosmetic, minor inconvenience | Backlog for future |

---

## Exploratory Testing

Beyond scripted tests, exploratory testing finds unexpected issues.

### Session-Based Approach

```markdown
## Exploratory Session

**Charter**: [What area to explore, what to look for]
**Time box**: [Duration, typically 30-60 min]
**Tester**: [Name]

### Notes
[Stream of consciousness notes during testing]

### Bugs Found
- [Bug 1]
- [Bug 2]

### Observations
[Things that aren't bugs but worth noting]

### Areas to Investigate Further
[Topics that need more testing]
```

### Exploratory Techniques

- **Boundary testing**: Test at limits (0, 1, max, max+1)
- **Negative testing**: Try to break it (invalid inputs, rapid clicks)
- **Persona-based**: Test as different user types
- **Scenario-based**: Test realistic user journeys, not just features

---

## Integration with Engineering

### QA in Development Flow

```
Story Ready -> Development -> Code Review -> QA Testing -> Done
                    |                              |
                    +--- Unit/Integration Tests ---+
                           (Engineering)
```

### Shift-Left Testing

Involve QA early to:
- Review acceptance criteria before development
- Identify testability issues early
- Create test cases in parallel with development

### Test Automation Ownership

| Test Type | Owner | Tools |
|-----------|-------|-------|
| Unit tests | Developer | Jest, RSpec, etc. |
| Integration tests | Developer | Testing library |
| E2E / Acceptance | QA + Developer | Cypress, Playwright |
| Performance | QA / DevOps | k6, Locust |

---

## Anti-Patterns

- **Testing in silos** - QA should be integrated, not a separate phase at the end
- **Only happy path** - Edge cases and error handling need tests too
- **No traceability** - Every test should map to a requirement
- **Testing everything equally** - Risk-based prioritization is essential
- **Manual-only testing** - Automate what's repeatable
- **Treating QA as gatekeepers** - Quality is everyone's responsibility
- **Shipping with P1 bugs** - Never accept critical issues

---

## Output Format

When completing QA activities, produce:

### For Test Planning
- Test plan document following template
- Acceptance criteria coverage matrix

### For Test Execution
- Test execution results with pass/fail status
- Bug reports for any failures
- Regression results summary

### For Release Assessment
- Release readiness checklist
- Known issues list with decisions
- Sign-off documentation

---

## Checklist: Before Release

- [ ] All acceptance criteria mapped to test cases
- [ ] All test cases executed
- [ ] No P1 bugs open
- [ ] P2 bugs resolved or explicitly accepted
- [ ] Regression suite passes
- [ ] Exploratory testing completed
- [ ] Release readiness assessment documented
- [ ] Sign-offs obtained
