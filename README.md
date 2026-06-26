# Personal Agent Skills

My agent skills that I use every day to do real engineering - not vibe coding.

I want to pause to acknowledge the fantastic work of Matt Pocock,
whose [engineering philosophy](https://github.com/mattpocock/skills/blob/main/README.md#why-these-skills-exist), [educational materials](https://www.aihero.dev/), and [public skills](https://github.com/mattpocock/skills)

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

## Writing & Editing

These skills help you write and edit Greenhouse-facing copy.

- **gh-writing-style** — Greenhouse's writing style guide: voice, tone, mechanics, punctuation, and product naming. Referenced by other skills for the house ruleset.

  ```
  npx skills@latest add tyler-morrison/skills/gh-writing-style
  ```

- **edit-copy** — Copy-edits a draft against Greenhouse style and judges whether it works. Delivers a verdict, a lightly-edited draft, and flags for the writer to carry forward.

  ```
  npx skills@latest add tyler-morrison/skills/edit-copy
  ```

## Tooling & Setup

These skills provide Quality of Life enhancements for agentic coding workflows.

- **model-guardrails-claude-code** — Installs `SessionEnd` hooks that clear project-pinned model overrides and reset the global default model when a Claude Code session ends.

  ```
  npx skills@latest add tyler-morrison/skills/model-guardrails-claude-code
  ```
