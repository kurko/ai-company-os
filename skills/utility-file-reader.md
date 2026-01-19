---
name: "File Reader"
description: "Read files with context-aware summarization. Use when managing large documents efficiently."
---

# File Reader

Context-safe file reading with intelligent summarization.

## When to Use

- Reading large documents that don't fit in context
- Need specific information from a file
- Managing token budget across multiple files
- Extracting relevant sections from documents

## Dependencies

- None - this is a utility skill

---

## Core Principle

**Return conclusion + relevant snippet + line numbers.**

Don't dump entire files into context. Extract what's needed.

---

## Reading Protocol

### 1. Receive Request

Request includes:
- File path
- What information is needed
- Optional: specific sections to focus on

### 2. Read the Document

Read the full document to understand its structure and content.

### 3. Extract Relevant Information

Based on the request:
- Identify relevant sections
- Note line numbers
- Formulate conclusion

### 4. Return Structured Response

```markdown
## File Read: [filename]

### Conclusion
[Direct answer to what was asked]

### Relevant Section(s)

**Lines [X-Y]:**
```
[Exact quote from the file]
```

**Lines [A-B]:**
```
[Another relevant section if needed]
```

### File Overview
[Brief description of what the file contains overall]

### Other Potentially Relevant Sections
- Lines [P-Q]: [Brief description]
- Lines [R-S]: [Brief description]
```

---

## Output Format

**Always include:**
- Direct answer/conclusion
- Line numbers for all quotes
- Exact quotes (not paraphrased)

**Include when helpful:**
- File overview
- Pointers to other relevant sections
- Relationship to other files

---

## Use Cases

### Finding Specific Information

Request: "What is the database connection string in config.yml?"

Response:
```markdown
## File Read: config.yml

### Conclusion
The database connection string is `postgresql://localhost:5432/myapp_production`

### Relevant Section(s)

**Lines 23-26:**
```yaml
database:
  adapter: postgresql
  host: localhost
  port: 5432
  database: myapp_production
```

### File Overview
Configuration file with database, cache, and API settings.
```

### Understanding Structure

Request: "How is the User model organized?"

Response:
```markdown
## File Read: app/models/user.rb

### Conclusion
The User model has validations for email/password, associations with Profile and Posts, and methods for authentication.

### Relevant Section(s)

**Lines 1-15:** Validations and associations
```ruby
class User < ApplicationRecord
  has_one :profile
  has_many :posts

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
```

**Lines 20-30:** Authentication methods
```ruby
def authenticate(password)
  # ...
end
```

### File Overview
145 lines total. Sections: validations, associations, callbacks, class methods, instance methods.
```

---

## Context Management

### When Reading Multiple Files

Prioritize:
1. Most relevant files first
2. Only relevant sections from each
3. Track cumulative token usage

### Token Budget Guidelines

| Budget | Approach |
|--------|----------|
| Tight | Conclusions only, minimal quotes |
| Normal | Conclusions + key sections |
| Generous | More context, related sections |

---

## Integration

### With agents
- Any agent can use file reader
- Useful for research, investigation

### With memory.md
- File reader doesn't replace memory
- Use memory for persistent notes

---

## Scope Limitation

**Document reading only.**

This skill does NOT apply to:
- Developers using normal code reading tools
- Direct file exploration
- File editing or writing

---

## Quality Checklist

- [ ] Line numbers included for all quotes
- [ ] Conclusion directly answers the request
- [ ] Quotes are exact (not paraphrased)
- [ ] File overview provides context
- [ ] Other relevant sections noted

---

## Anti-Patterns

- **Dumping full files** - Extract only what's needed
- **Missing line numbers** - Always include for traceability
- **Paraphrasing quotes** - Use exact text
- **Ignoring context** - Note what else might be relevant
- **Over-summarizing** - Keep enough detail to be useful
