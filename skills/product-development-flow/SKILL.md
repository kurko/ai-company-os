---
name: "Product Development Flow"
description: "Orchestrate the full product flow from vision to shipped code. Use when starting a new feature or product."
---

# Product Development Flow

Meta-skill orchestrating the full product development pipeline.

## When to Use

- Starting a new product or major feature
- Need to understand where a project stands in the flow
- Checking dependencies before advancing to next stage
- Onboarding to an existing project

## Dependencies

- None - this is the orchestration layer

## Book Triggers

Reference: [[books/product-innovation.md]]
- Apply "Escaping the Build Trap" outcome focus
- Use "Inspired" for product discovery principles

Reference: [[books/systems-thinking.md]]
- Apply "Product Development Flow" for work-in-progress and batching
- Use "Thinking in Systems" for feedback loops

---

## The Flow

```
Vision/North Star
       |
       v
  Brainstorming (optional)
       |
       v
      PRD
       |
       v
 Scoping/Shaping
       |
       v
   User Stories
       |
       v
    Backlog
       |
       v
     Code <---> Review/QA
       |
       v
     Merge
```

---

## Stages and Skills

| Stage | Skill | Input | Output | Optional? |
|-------|-------|-------|--------|-----------|
| Vision | `vision.md` | Idea, problem | Vision document | No |
| Brainstorm | `brainstorm.md` | Vision doc | Ideas, options | Yes |
| PRD | `prd.md` | Vision doc | Requirements doc | No |
| Scoping | `prd.md` (scope section) | PRD | Scoped PRD | No |
| User Stories | `user-stories.md` | PRD | Story list | No |
| Backlog | `backlog.md` | Stories | Prioritized tasks | No |
| Code | Engineering agents | Tasks | Implementation | No |
| Review | `code-review.md` | Code | Approved code | No |
| Merge | `utility-git-commit.md` | Approved code | Shipped | No |

---

## Stage Dependencies

Each skill verifies its dependencies before proceeding:

### vision.md
- **Requires:** Nothing (starting point)
- **Produces:** `projects/{project}/docs/vision.md`

### brainstorm.md
- **Requires:** Vision document exists
- **Check:** `projects/{project}/docs/vision.md`
- **Produces:** `projects/{project}/docs/brainstorm.md`

### prd.md
- **Requires:** Vision document exists
- **Check:** `projects/{project}/docs/vision.md`
- **Produces:** `projects/{project}/docs/prd/{feature}.md`

### user-stories.md
- **Requires:** PRD exists
- **Check:** `projects/{project}/docs/prd/{feature}.md`
- **Produces:** Stories in PRD or separate file

### backlog.md
- **Requires:** User stories exist
- **Check:** Stories defined
- **Produces:** `projects/{project}/tasks/` entries

### code-review.md
- **Requires:** Code changes to review
- **Produces:** Approval or change requests

---

## Dependency Verification Protocol

When a skill is triggered:

1. **Check for required artifacts**
   ```
   Does projects/{project}/docs/vision.md exist?
   ```

2. **If missing:**
   - Notify the requesting agent
   - Ask: "Vision document not found. Should I create one first, or proceed anyway?"

3. **If proceeding without dependency:**
   - Document the decision
   - Note the gap in the output

4. **If creating dependency first:**
   - Invoke the prerequisite skill
   - Then return to the original request

---

## Parallel vs Sequential

### Sequential (Default)
Most stages flow linearly:
- Vision → PRD → Stories → Backlog

### Parallel Exploration
Some stages can run in parallel:
- Brainstorming multiple options
- Multiple PRD variants
- Different scoping approaches

Use `facilitator.md` when parallel exploration needs synthesis.

---

## Stage Outputs

### Vision Document
```
projects/{project}/docs/vision.md
```
Contains: problem, solution hypothesis, success criteria, scope

### Brainstorm Document
```
projects/{project}/docs/brainstorm.md
```
Contains: ideas explored, options considered, selection rationale

### PRD
```
projects/{project}/docs/prd/{feature-name}.md
```
Contains: requirements, user stories, acceptance criteria, scope

### Tasks
```
projects/{project}/tasks/
```
Contains: individual task files or entries in project management tool

---

## Project Kickoff Integration

For new projects, use `project-kickoff.md` to:
1. Interview the founder about the idea
2. Determine which stages are needed
3. Route to appropriate department
4. Begin the flow

---

## Flow State Tracking

Use `memory.md` to track where a project stands:

```markdown
## Project Flow State

**Project:** {project-name}
**Current Stage:** PRD
**Last Updated:** YYYY-MM-DD

### Completed Stages
- [x] Vision - `docs/vision.md`
- [x] Brainstorm - `docs/brainstorm.md`

### Current Stage
- [/] PRD - In progress

### Remaining
- [ ] User Stories
- [ ] Backlog
- [ ] Implementation
```

---

## Skipping Stages

Some stages can be skipped based on project needs:

| Stage | When to Skip |
|-------|--------------|
| Brainstorm | Solution is clear, no exploration needed |
| Detailed PRD | Small feature, stories sufficient |
| User Stories | Technical task, no user-facing changes |

**Always document** when skipping a stage and why.

---

## Integration

### With project-kickoff.md
- Kickoff determines entry point into flow
- Some projects start at PRD (vision exists)
- Some start fresh from vision

### With agents
- Product roles own early stages (vision, PRD)
- Engineering roles own later stages (code, review)
- Handoffs happen at stage boundaries

### With memory.md
- Track flow state in project memory
- Session recaps note progress through flow

---

## Anti-Patterns

- **Skipping vision** - Every project needs clarity on the "why"
- **PRD without vision** - Requirements need grounding in purpose
- **Code before stories** - Implementation needs clear acceptance criteria
- **Reviewing nothing** - Every code change gets review
- **Forgetting state** - Always track where you are in the flow
