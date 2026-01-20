---
name: "Git Commit"
description: "Create well-structured git commits. Use when committing code changes."
---

# Git Commit

Create meaningful commits following conventional standards.

## When to Use

- After completing a piece of work
- When code is reviewed and ready
- Creating atomic, logical commits

## Dependencies

- **code-review.md** - Code should be reviewed first
  - Check: Self-review completed

---

## Commit Message Format

### Structure

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type

| Type | When to Use |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting, no code change |
| `refactor` | Code change that neither fixes nor adds |
| `test` | Adding/correcting tests |
| `chore` | Maintenance tasks |

### Scope (Optional)

Component or area affected:
- `auth`, `api`, `ui`, `db`, etc.

### Subject

- Imperative mood: "add" not "added" or "adds"
- No period at end
- Max 50 characters
- Lowercase start

### Body (Optional)

- Explain what and why, not how
- Wrap at 72 characters
- Separate from subject with blank line

### Footer (Optional)

- Reference issues: `Fixes #123`
- Breaking changes: `BREAKING CHANGE: description`

---

## Examples

### Simple Feature
```
feat(auth): add password reset flow
```

### With Body
```
fix(api): handle null response from payment provider

The payment API occasionally returns null instead of an error
object when the service is degraded. This caused unhandled
exceptions in production.

Fixes #456
```

### Breaking Change
```
refactor(api): change response format for /users endpoint

BREAKING CHANGE: response now returns array directly instead of
wrapped in { data: [] } object
```

---

## Commit Guidelines

### Atomic Commits

Each commit should:
- Represent one logical change
- Be independently buildable
- Have passing tests

### What to Commit

- [ ] Only intended changes (check diff)
- [ ] No debug code
- [ ] No commented-out code
- [ ] No sensitive data (credentials, keys)
- [ ] No large binary files

### What NOT to Commit

- Temporary files
- IDE configuration (unless shared)
- Node modules, vendor directories
- Environment files with secrets

---

## Pre-Commit Checklist

Before committing:

- [ ] Tests pass locally
- [ ] Linter passes
- [ ] Self-review completed
- [ ] No unintended changes in diff
- [ ] Commit message follows format
- [ ] No sensitive data included

---

## Workflow

### 1. Review Changes

```bash
git status
git diff
```

### 2. Stage Intentionally

```bash
# Stage specific files
git add path/to/file

# Or stage interactively
git add -p
```

### 3. Write Message

Write message following format above.

### 4. Commit

```bash
git commit
```

### 5. Verify

```bash
git log -1  # Check commit
git show    # Verify contents
```

---

## Integration

### With code-review.md
- Review before commit
- Commit reflects reviewed changes

### With CI/CD
- Commits trigger builds
- Commit message used in changelogs

---

## Anti-Patterns

- **"WIP" commits** - Don't commit work in progress
- **Giant commits** - Keep commits atomic
- **"Fix stuff"** - Write meaningful messages
- **Mixing concerns** - One logical change per commit
- **Committing secrets** - Never commit credentials
- **Ignoring diff** - Always review before commit
