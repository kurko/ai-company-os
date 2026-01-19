---
name: "Code Review"
description: "Review code for quality, correctness, and standards. Use before commits or when reviewing PRs."
---

# Code Review

Systematic code review following software craft principles.

## When to Use

- Before committing code
- Reviewing pull requests
- Auditing existing code quality
- When requested to review changes

## Dependencies

- None - can be applied to any code

## Book Triggers

Reference: [[books/software-craft.md]]
- Apply "Clean Code" naming and structure principles
- Use "GOOS" test-first thinking
- Apply "Sandi Metz" OOP design rules
- Use "Practical Object-Oriented Design" composition patterns

---

## Review Dimensions

### 1. Correctness

Does the code do what it's supposed to do?

- [ ] Meets acceptance criteria
- [ ] Handles edge cases
- [ ] Error handling is appropriate
- [ ] No obvious bugs

### 2. Design

Is the code well-structured?

- [ ] Single Responsibility - each class/function does one thing
- [ ] Clear abstractions
- [ ] Minimal coupling between components
- [ ] Appropriate use of patterns
- [ ] No premature optimization

### 3. Readability

Can others understand this code?

- [ ] Names reveal intent
- [ ] Functions are small (5-15 lines preferred)
- [ ] Comments explain "why", not "what"
- [ ] Consistent formatting
- [ ] No magic numbers/strings

### 4. Testing

Is the code properly tested?

- [ ] Tests exist
- [ ] Tests are meaningful (not just coverage)
- [ ] Tests are readable
- [ ] Edge cases tested
- [ ] Tests run fast

### 5. Security

Is the code secure?

- [ ] No hardcoded credentials
- [ ] Input is validated
- [ ] Output is escaped appropriately
- [ ] No SQL injection risk
- [ ] No XSS risk

---

## Review Process

### 1. Understand Context

Before reviewing:
- What is this change trying to accomplish?
- What acceptance criteria apply?
- What's the scope of the change?

### 2. First Pass: Big Picture

Scan the entire change:
- Does the overall approach make sense?
- Is the architecture appropriate?
- Are there any red flags?

### 3. Second Pass: Details

Line-by-line review:
- Check each dimension above
- Note specific issues
- Identify questions

### 4. Provide Feedback

Structure feedback clearly:
- **Must Fix**: Blocking issues
- **Should Fix**: Important but not blocking
- **Consider**: Suggestions for improvement
- **Questions**: Clarifications needed

---

## Feedback Template

```markdown
## Code Review: [PR/Change Title]

### Summary
[1-2 sentence summary of the change and overall assessment]

### Verdict
Approve / Request Changes / Comment

---

### Must Fix

[Blocking issues that must be addressed]

- **[File:Line]**: [Issue description]
  - Why: [Explanation]
  - Suggestion: [How to fix]

---

### Should Fix

[Important issues to address]

- **[File:Line]**: [Issue description]
  - Why: [Explanation]
  - Suggestion: [How to fix]

---

### Consider

[Non-blocking suggestions]

- **[File:Line]**: [Suggestion]

---

### Questions

- [Question about the change]
- [Another question]

---

### What's Good

[Positive aspects worth calling out]

- [Good thing]
- [Another good thing]
```

---

## Common Issues Checklist

### Naming
- [ ] Variables describe what they hold
- [ ] Functions describe what they do
- [ ] Classes describe what they are
- [ ] No abbreviations unless universal

### Functions
- [ ] Do one thing
- [ ] Named after what they do
- [ ] Few parameters (prefer 0-2, max 3)
- [ ] No flag parameters
- [ ] Don't modify input parameters

### Classes
- [ ] Cohesive (members used together)
- [ ] Single responsibility
- [ ] Prefer composition over inheritance
- [ ] Small interfaces

### Error Handling
- [ ] Specific exceptions caught
- [ ] Errors handled at appropriate level
- [ ] Error messages are helpful
- [ ] No empty catch blocks

### Dependencies
- [ ] Minimal external dependencies
- [ ] Injected dependencies (not hard-coded)
- [ ] Version constraints appropriate

---

## Language-Specific Considerations

### JavaScript/TypeScript
- Proper async/await usage
- Type safety (if TypeScript)
- Appropriate use of const/let
- No var

### Ruby
- Idiomatic Ruby style
- Method visibility (public/private)
- Duck typing used appropriately

### Python
- PEP 8 compliance
- Type hints where helpful
- Pythonic idioms

---

## Pre-Commit Review

Before any commit:

1. **Self-review first**
   - Read your own diff
   - Apply this checklist

2. **Run automated checks**
   - Tests pass
   - Linter passes
   - Type checker passes

3. **Check for sensitive data**
   - No credentials
   - No personal data
   - No internal URLs

4. **Verify scope**
   - Only intended changes
   - No debug code
   - No unrelated changes

---

## Integration

### With utility-git-commit.md
- Review should happen before commit
- Commit message should match change

### With engineers
- Senior engineers review junior code
- Pair review for complex changes
- All code reviewed before merge

---

## Anti-Patterns

- **Rubber stamping** - Actually read the code
- **Nitpicking only** - Focus on substance
- **No positives** - Acknowledge good work
- **Vague feedback** - Be specific and actionable
- **Blocking on style** - Use linters for style
- **Reviewing too much** - Smaller changes are better
