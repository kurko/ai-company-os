# Company Library Index

Neural triggers for agent behavior. Reference books by name to activate the model's trained knowledge without filling the context window.

## Book Files by Domain

| Domain | File | Key Books |
|--------|------|-----------|
| Software Craft | [software-craft.md](software-craft.md) | Clean Code, GOOS, Sandi Metz |
| Systems & Flow | [systems-thinking.md](systems-thinking.md) | Thinking in Systems, Product Dev Flow |
| Product & Innovation | [product-innovation.md](product-innovation.md) | Build Trap, Innovator's Dilemma |
| Leadership & Management | [leadership-management.md](leadership-management.md) | High Output Management, Manager's Path |
| Startup & Business | [startup-business.md](startup-business.md) | Lean Startup, Rework |
| Thinking & Rationality | [thinking-rationality.md](thinking-rationality.md) | Scout Mindset, Black Swan |
| Personal Effectiveness | [personal-effectiveness.md](personal-effectiveness.md) | Deep Work, Atomic Habits |

## How to Use

In agent/skill definitions, reference the domain file:

```markdown
## Book Triggers
Reference: [[books/software-craft.md]]
- Apply "Clean Code" naming principles
- Use "GOOS" test-first approach
```

This activates the model's knowledge of these books without token overhead.

## Adding Books

When adding a new book:
1. Add to the appropriate domain file
2. Include: title, author, trigger phrase, key concepts, when to invoke
3. Keep descriptions brief - just enough to trigger association
