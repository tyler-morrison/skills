# Agent Skills

A collection of agent skills that extend capabilities across planning, development, and tooling.

## Planning & Design

These skills help you think through problems before writing code.

- **to-opportunity** — Turns the current conversation into an Opportunity Statement and submits it to Jira Product Discovery.

  ```
  npx skills@latest add tyler-morrison/skills/to-opportunity
  ```

- **to-solution** — Creates a Solution Definition and submits it as a JPD Solution ticket, linking it to a parent Opportunity.

  ```
  npx skills@latest add tyler-morrison/skills/to-solution
  ```

- **to-prd** — Writes a Product Requirements Document (PRD) and submits it as a Jira Epic.

  ```
  npx skills@latest add tyler-morrison/skills/to-prd
  ```

## Tooling & Setup

These skills provide Quality of Life enhancements for agentic coding workflows.

- **model-guardrails-claude-code** — Installs `SessionEnd` hooks that clear project-pinned model overrides and reset the global default model when a Claude Code session ends.

  ```
  npx skills@latest add tyler-morrison/skills/model-guardrails-claude-code
  ```
