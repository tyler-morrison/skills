# Decision format

A Decision records what was chosen and why, so the reasoning survives. Worth posting when the choice was a real trade-off someone might otherwise revisit or "fix" later.

## Headline

`Topic: what was chosen, framed as a benefit` — sentence case, active voice.

- Good: "XState: building predictable AI workflows with state machines"
- Avoid: "Decision about which orchestration framework to use"

## The beats

Cover these in tight prose, not a numbered list:

1. **The decision** — what was chosen, and when.
2. **Context** — the problem it solves or opportunity it captures.
3. **Alternatives** — what else was considered.
4. **Tradeoffs** — what you gain and what you give up.

## Optional sections

Add only when they earn their place:

- **Known constraints** — 2–4 bullets, each under 15 words. Honest limitations of the choice.
- **Next steps** — 3–5 ordered bullets toward putting the decision into practice.

## Worked example

> # Decision: Workflow orchestration framework
>
> ## XState: building predictable AI workflows with state machines
>
> LLMs are non-deterministic by nature — the same input can produce a different output, and that's a feature, not a bug. But when an AI agent is navigating a multi-stage workflow, unpredictability without boundaries is a liability. The architecture I wanted was a deterministic shell with a stochastic core: the LLM reasons freely inside each state, but the machine controls what states are reachable, what conditions must be met to move between them and what happens when something goes wrong. Pipeline tools like LangChain, MLflow and GitHub Agentic Workflows are excellent at chaining LLM calls, but they model sequence — not state — so there's no formal mechanism for guard conditions, fallback transitions or knowing with certainty where the workflow stands. XState is the only actively maintained framework that delivers hierarchical/parallel states, serializable snapshots and a full actor model.
>
> **Known constraints:**
> - Statechart mental model will require deliberate onboarding if this ever gets contributors
>
> **Next steps:**
> - Validate root machine topology against real user flows before building stage-level logic
> - Document the entry/exit guard contract for each workflow stage
> - Instrument max-transition counters as the first safety valve before any LLM calls route through the machine

Why it works: leads with the problem the choice solves, names the alternatives and exactly why they fell short, and is upfront about the cost (onboarding overhead) without backing away from the call.