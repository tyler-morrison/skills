# Risk format

A Risk surfaces a potential blocker before it derails progress. The goal is a clear-eyed picture and a plan — not alarm.

## Headline

State the risk plainly. Sentence case, active voice, specific enough that a reader knows the stakes without opening it.

- Good: "Rovo MCP ADF content may be stripped on edit operations"
- Avoid: "Possible issues with the MCP integration"

## The beats

Cover these in tight prose, not a numbered list:

1. **The risk** — what could go wrong, and when it could happen.
2. **Impact** — what fails if it materializes.
3. **Likelihood** — how probable, with data or signals.
4. **Current state** — are we seeing early signs yet.
5. **Mitigation** — what reduces or eliminates it.

## Mitigation plan

Risks use **Mitigation plan:** instead of next steps — a bulleted list of concrete actions: constrain scope, monitor a signal, build a fallback, document the constraint. Order by what you'd do first.

## Worked example

> # Risk: Rovo MCP ADF content may be stripped on edit operations
>
> Any edit made through the Rovo MCP to a field containing ADF-rich content — Smart Links, @mentions, panels, tables, task lists — silently strips that content with no error or warning. The root cause is a lossy ADF → Markdown → ADF conversion: the MCP reads rich content, presents a flattened Markdown representation to the LLM, then converts it back, discarding anything Markdown can't represent. This is a confirmed open bug affecting both Jira and Confluence, and the affected node types are pervasive — not edge cases. The risk materializes the moment Sprout attempts any edit to a JPD idea that already contains rich content, which becomes more likely as the shared pool grows. We haven't triggered it yet because Sprout is currently create-only, but that scope will expand.
>
> **Mitigation plan:**
> - Constrain Sprout's MCP operations to `create` only until Atlassian patches the issue
> - Monitor the upstream issue for resolution or workaround
> - If an edit path is needed before the fix ships, explore read-modify-write via the Atlassian REST API directly
> - Document this as a known constraint in Sprout's architecture notes

Why it works: names the failure and its exact mechanism, quantifies the blast radius ("pervasive, not edge cases"), is honest that it hasn't fired yet, and pairs every concern with an action. No hand-wringing.