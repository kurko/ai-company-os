# Vision-to-Product: Build Todo

## Context
Building a multi-agent AI company simulation that takes ideas from vision to shipped product.
The system uses agents (isolated execution), skills (knowledge injection), and neural triggers (books).
Order of operations: Core skills first, then co-founder agent, then AR department to write remaining agents.

See `spec.md` for full specification, `folder-structure.md` for naming conventions.

## Tasks

### Phase 1: Core Skills (Tier 0)

- [x] Create skills/decision-making.md
    Tier 0 axioms and decision principles
    References company/docs/decision-principles.md
    Books: Black Swan, Scout Mindset, Thinking in Systems
    DONE: Created with decision framework, risk matrix, output format

- [x] Create skills/thinking.md
    Complex problem decomposition
    Includes devil's advocate behavior (spawn opposing viewpoint)
    Sub-agent pattern for "ideas in the brain"
    Books: Scout Mindset, Thinking in Systems
    DONE: Created with decomposition, sub-agent pattern, devil's advocate, uncertainty tracking

### Phase 2: Foundation Skills

- [x] Create skills/create-agent.md
    How to create and improve agents & skills
    Template structure for agents
    Template structure for skills
    Dependency declaration patterns
    DONE: Templates for roles, consultants, skills; naming conventions; checklists

- [x] Create skills/facilitator.md
    Coordinating multi-agent discussions
    Structured debate rounds
    Proactive opposing views
    Used by board-chairman, hub agents
    DONE: Full protocol with phases, round limits, contrarian injection, output format

- [x] Create skills/memory.md
    Working memory management
    Session recaps and handoffs
    Agent memory persistence
    Meeting notes structure
    DONE: Session protocol, meeting notes format, agent working memory, handoff recaps

- [x] Create skills/create-skill.md (added)
    DONE: Proper front matter template, design principles, checklist
    Also fixed all existing skills to add YAML front matter

- [x] Create skills/writing-documents.md
    TLDR-first structure
    Formatting standards
    Progressive detail disclosure
    DONE: Document template, section guidelines, quality checklist

### Phase 3: First Agent (Co-founder)

- [x] Create agents/role-exec-cofounder.md
    The AI itself as co-founder
    Has access to all skills
    Can spawn any other agent
    Works alongside founder (user)
    First agent to be built
    DONE: Full agent with delegation table, session protocol, operating principles

### Phase 4: AR Department (AI Resources)

- [x] Create agents/role-ar-director.md
    Director of AI Resources
    Responsible for writing and improving agents
    Uses create-agent skill
    Replaces traditional HR for AI workforce
    DONE: Full agent with creation process for roles/consultants/skills, roster tracking

### Phase 5: Research Skill

- [x] Create skills/research.md
    Dual-mode: project research + meta research
    Dual verification pattern (research twice, compare)
    Web search and source validation
    DONE: Two modes (project/meta), dual verification with sub-agents, depth levels

### Phase 6: Product Development Flow Skills

- [x] Create skills/product-development-flow.md
    Meta-skill orchestrating full flow
    Defines stage dependencies
    Vision -> Brainstorm -> PRD -> Stories -> Backlog -> Code
    DONE: Full flow diagram, stage dependencies, verification protocol, state tracking

- [x] Create skills/vision.md
    Create vision documents
    First stage in product flow
    No dependencies
    DONE: Template, discovery process, scope levels, quality checklist

- [x] Create skills/brainstorm.md
    DONE: Divergent/convergent phases, multi-agent protocol, output template

- [x] Create skills/prd.md
    DONE: Full template, scoping process, MoSCoW prioritization

- [x] Create skills/user-stories.md
    DONE: INVEST criteria, story splitting techniques, acceptance criteria patterns

- [x] Create skills/backlog.md
    DONE: Stack ranking, Cost of Delay, WIP limits, refinement process

- [x] Create skills/project-kickoff.md
    DONE: Discovery interview template, routing guidelines, department assignments

### Phase 7: Engineering Skills

- [x] Create skills/code-review.md
    DONE: Review dimensions, feedback template, language-specific checks

- [x] Create skills/utility-git-commit.md
    DONE: Conventional format, types, pre-commit checklist

- [x] Create skills/utility-file-reader.md
    DONE: Conclusion + snippet + line numbers protocol, context management

### Phase 8: Communication Skill

- [x] Create skills/communication.md
    DONE: Multi-backend abstraction, markdown default, status mapping

### Phase 9: Board Agents

- [x] Create agents/board-chairman.md
    Facilitates board discussions
    Uses facilitator skill
    Manages consensus process
    DONE: Orchestrator pattern, spawns all board members, structured deliberation protocol

- [x] Create agents/board-conservative.md
    Risk-averse thinking style
    Via negativa perspective
    Margin of safety focus
    DONE: Reversibility analysis, stress testing, downside protection framework

- [x] Create agents/board-aggressive.md
    Growth-focused style
    Opportunity cost perspective
    Speed and market timing
    DONE: Definite optimism, asymmetric upside analysis, Zero to One references

- [x] Create agents/board-technical.md
    Deep technical perspective
    Feasibility analysis
    Architecture implications
    DONE: Effort calibration, debt assessment, response framework with 6 sections

- [x] Create agents/board-customer.md
    Customer/market perspective
    User advocacy
    Market validation
    DONE: Jobs to be Done, validation status tracking, The Mom Test principles

### Phase 10: Consultants (Real People)

- [x] Create agents/consultant-ryan-singer.md
    Shape Up methodology
    Appetite-based scoping
    Pitches and cycles
    DONE: Full research with dual verification, 12 verified sources

- [ ] Create agents/consultant-dhh.md
    Technical philosophy
    Rails way, simplicity
    Opinionated frameworks

- [ ] Create agents/consultant-jony-ive.md
    Design excellence
    Form follows function
    Intentional minimalism

- [x] Create agents/consultant-alex-hormozi.md
    Business/growth perspective
    Offer creation
    Value equations
    DONE: Full research with dual verification, Value Equation and Grand Slam Offer frameworks

- [x] Create agents/consultant-sandi-metz.md
    OOP design
    SOLID principles
    Practical refactoring
    DONE: Full research with dual verification, Sandi's Rules, Flocking Rules

- [ ] Create agents/consultant-devils-advocate.md
    Unbiased contrarian perspective
    No persona, pure opposition
    Falsification focus

- [ ] Create agents/consultant-anonymous.md
    Quick opinions
    No persona overhead
    Fast feedback

### Phase 11: Executive Roles

- [ ] Create agents/role-exec-ceo.md
    Chief Executive Officer
    Strategic direction
    Final decisions

- [ ] Create agents/role-exec-cto.md
    Chief Technology Officer
    Technical strategy
    Architecture oversight

- [ ] Create agents/role-exec-cmo.md
    Chief Marketing Officer
    Marketing strategy
    Brand and positioning

- [ ] Create agents/role-exec-cfo.md
    Chief Financial Officer
    Financial strategy
    Resource allocation

### Phase 12: Product Roles

- [ ] Create agents/role-prod-director.md
    Director of Product Strategy
    Product vision
    Roadmap ownership

- [x] Create agents/role-prod-manager.md
    Product Manager
    Feature ownership
    Stakeholder coordination
    DONE: Orchestrator pattern, uses prd/user-stories/backlog skills

- [ ] Create agents/role-prod-designer.md
    Product Designer
    UX/UI design
    User research synthesis

- [ ] Create agents/role-prod-researcher.md
    User Researcher
    Research methodology
    Insight generation

### Phase 13: Engineering Roles

- [ ] Create agents/role-eng-director.md
    Director of Engineering
    Engineering strategy
    Team structure

- [ ] Create agents/role-eng-manager.md
    Engineering Manager
    Team leadership
    Delivery coordination

- [ ] Create agents/role-eng-architect.md
    Software Architect
    System design
    Technical decisions

- [ ] Create agents/role-eng-developer-sr.md
    Senior Developer
    Complex implementation
    Mentorship

- [x] Create agents/role-eng-developer.md
    Developer
    Feature implementation
    Code quality
    DONE: Executor pattern, model: opus (per founder decision)

- [ ] Create agents/role-eng-devops.md
    DevOps Engineer
    Infrastructure
    CI/CD pipelines

- [ ] Create agents/role-eng-security.md
    Security Engineer
    Security reviews
    Vulnerability assessment

- [ ] Create agents/role-eng-qa.md
    QA Engineer
    Test strategy
    Quality assurance

### Phase 14: Marketing Roles

- [ ] Create agents/role-mkt-director.md
    Director of Marketing
    Marketing strategy
    Campaign oversight

- [ ] Create agents/role-mkt-content.md
    Content Strategist
    Content creation
    Messaging

- [ ] Create agents/role-mkt-growth.md
    Growth Marketer
    Acquisition
    Conversion optimization

### Phase 15: Hub Agents

- [x] Create agents/hub-consultancy.md
    Spawns relevant consultants
    Routes questions to experts
    Aggregates opinions
    DONE: Uses facilitation skill, synthesizes multi-consultant perspectives

### Phase 16: Book Files (Neural Triggers)

- [x] Create books/software-craft.md
    Clean Code, GOOS, Sandi Metz
    Naming, testing, OOP design
    DONE: Neural triggers for code quality books

- [x] Create books/systems-thinking.md
    Thinking in Systems, Product Dev Flow
    Feedback loops, constraints
    DONE: Neural triggers for systems books

- [x] Create books/product-innovation.md
    Build Trap, Innovator's Dilemma
    Product strategy, disruption
    DONE: Neural triggers for product books

- [x] Create books/leadership-management.md
    High Output Management, Manager's Path
    Leadership principles
    DONE: Neural triggers for leadership books

- [x] Create books/startup-business.md
    Lean Startup, Rework
    Validation, simplicity
    DONE: Neural triggers for startup books

- [x] Create books/thinking-rationality.md
    Scout Mindset, Black Swan
    Cognitive biases, uncertainty
    DONE: Neural triggers for rationality books

- [x] Create books/personal-effectiveness.md
    Deep Work, Atomic Habits
    Focus, habits, productivity
    DONE: Neural triggers for productivity books
