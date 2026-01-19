# Research: Neural Triggers from Papers and Studies

## Status
Backlog

## Context: Why Neural Triggers Work

LLMs like Claude have been trained on vast corpora that include books, papers, and other sources. When we reference a book by name in agent instructions (e.g., "Apply principles from Clean Code" or "Use Thinking in Systems feedback loop analysis"), we're not injecting new knowledge—we're **activating knowledge the model already has**.

This means:
- A single book reference can invoke an entire framework without filling the context window
- The model can draw on nuanced concepts from that book without us spelling them out
- We get the benefit of the book's wisdom at minimal token cost

**Example:** Instead of writing 500 tokens explaining TDD principles, we write "Apply GOOS (Growing Object-Oriented Software) test-first approach" and the model activates its understanding of Freeman & Pryce's methodology.

This is why books work so well as triggers—they're well-represented in training data with coherent, memorable frameworks.

## Problem

Currently, the system uses books as neural triggers. However, books represent only one source of validated knowledge that the model has been trained on.

Academic papers, research studies, and empirical findings could provide additional high-quality triggers, especially for:
- Decision-making under uncertainty
- Cognitive biases and debiasing techniques
- Team dynamics and collaboration
- Product development methodologies
- Software engineering practices

## Research Questions

1. **What types of papers are most useful as neural triggers?**
   - Meta-analyses vs individual studies
   - Foundational papers vs recent findings
   - Industry reports vs academic research

2. **How should papers be referenced differently than books?**
   - Books have cohesive frameworks; papers have specific findings
   - Papers may have narrower applicability
   - Citation format and credibility signals

3. **What domains would benefit most from paper-based triggers?**
   - Behavioral economics (Kahneman, Thaler)
   - Organizational psychology
   - Human-computer interaction
   - Software engineering empirical studies

4. **How to keep paper references current?**
   - Papers get superseded; books are more stable
   - Replication crisis considerations
   - Version control for research references

## Potential Paper Sources

- **Decision Making**: Kahneman & Tversky prospect theory papers
- **Team Performance**: Google's Project Aristotle findings
- **Software Engineering**: DORA State of DevOps reports
- **Product**: Jobs-to-be-Done empirical studies
- **Cognitive Load**: Miller's "Magical Number Seven" and updates
- **Estimation**: Cone of Uncertainty studies

## Output

A new section in the books/ directory or a parallel papers/ directory with:
- Curated list of foundational papers by domain
- Trigger phrases and key findings (not full abstracts)
- When to invoke each paper's insights
- Cross-references to related books

## Dependencies
- Research skill must support paper lookup
- create-agent skill must support paper references alongside books

## Priority
Low - books provide strong foundation; papers are enhancement

## Notes
Consider whether papers should be:
- Mixed into existing book files (e.g., `books/decision-making.md` includes both)
- Separate directory (`papers/`)
- Tagged differently in agent/skill references
