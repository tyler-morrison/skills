---
name: to-solution
description: >
  Create a Solution Definition and submit it as a JPD Solution ticket.
  Use when user wants to define a solution, propose an approach for an Opportunity, or plan a new product initiative in JPD.
argument-hint: Optional Opportunity ticket key (e.g. RD-42)
---

# To Solution

## Process

### 1. Gather context

Work from whatever is already in the conversation context.

<important if="arguments were passed into this skill">
Use $ARGUMENTS[0] to fetch the parent Opportunity ticket via Atlassian MCP.
</important>

### 2. Explore the codebase (optional)

If you have not already explored the codebase, do so to understand the current state of the code.

### 3. Quiz the user

Ask the user:

- What approach are we proposing and why this one over alternatives?
- What's the user experience at a "fat marker sketch" level?
- What's in scope and what's explicitly out?
- What does success look like (leading and lagging indicators)?
- What's still unresolved and who owns each open question?
- Does this need phased delivery or is it a single milestone?

### 4. Create the Jira ticket

Draft each section one at a time, using the template below.
Pause after each section for confirmation or clarifying questions.

The Solution Definition should be submitted as a JPD issue via Atlassian MCP with `issueTypeName: "Solution"` and `projectKey: "RD"` (or as specified).

## Template

<solution-definition-template>

### Problem context

Briefly summarize the problem this Solution addresses and link to the parent Opportunity for the full picture. The reader should understand why this work exists without clicking away, but the Opportunity has the detailed evidence.

[1-2 sentence summary of the problem. Link to the parent Opportunity ticket for full context.]

- ✅ GOOD — Brief summary with link, then pivots to what this Solution proposes:

  > _Recruiters spend 20+ minutes per candidate on manual scheduling because our scheduling tool doesn't integrate with the candidate profile ([RD-42](link)). This Solution explores an embedded scheduling experience._

- ❌ BAD — Re-articulates the entire problem, duplicating the Opportunity:

  > _Scheduling is a major pain point. Our NPS scores show it's the #1 complaint. Three enterprise prospects cited it as a blocker representing $1.2M in pipeline. Support tickets have increased 35% QoQ. Recruiters have to open multiple tabs and manually copy data between systems..._

### Solution approach

Describe the experience we're building, not the architecture behind it. Walk through what users will do differently once this ships. Stay at the "fat marker sketch" level: clear enough to align the team, loose enough to leave room for design and engineering to shape the details.

[1 short paragraph describing the core experience.]

- ✅ GOOD — Describes the user experience at "fat marker sketch" level:

  > _Embed a scheduling panel directly in the candidate profile sidebar. Recruiters select interviewers, view real-time availability, and send a confirmation, all without leaving the page. The system auto-suggests time slots based on interviewer preferences and timezone._

- ❌ BAD — Jumps to implementation architecture:

  > _Build a React micro-frontend that communicates with a new Scheduling Service via GraphQL. The service polls Google Calendar and Outlook APIs every 30 seconds to maintain an availability cache in Redis. We'll use a pub/sub model for real-time updates via WebSockets._

**Phased delivery (optional, for larger initiatives):**

- **Phase 1 (MVP):** [What ships first and what it proves]
- **Phase 2:** [What follows if Phase 1 validates]

### Scope boundaries

Scope boundaries prevent the Solution from growing past what the team can deliver well. Be explicit. If something feels like it could be in scope, but isn't, name it here and say why.

**In scope:**

- [Capability 1]
- [Capability 2]
- [Capability 3]

**Not in scope:**

✅ GOOD — Clear exclusion with rationale:

- _Calendar provider integrations beyond Google and Outlook. We'll validate the pattern with two providers first._
- _Recurring availability preferences. One-time slot selection only in MVP. Revisit after adoption data._

❌ BAD — Hedged, non-committal scope boundaries:

- _We'll try to include Outlook support if time permits._
- _Mobile scheduling is probably out of scope but we might look at it._
- _Advanced analytics, unless the team has extra capacity._

### What success looks like

Define the outcomes this Solution is accountable for. These aren't acceptance criteria (that's the Epic's job). These are the signals that tell us whether the Solution actually moved the needle for users and the business.

- **Leading indicator:** [Behavioral change we expect to see quickly. State the baseline and target if known.]
- **Lagging indicator:** [Business outcome we expect over time. Revenue, retention, adoption, cost reduction.]
  - ✅ GOOD — Measurable outcomes with baselines, separated into leading and lagging:

    > _Leading: 80% of interview loops are scheduled within the candidate profile (vs. 0% today). Lagging: Time-to-schedule drops from 20 minutes to under 5 minutes, measured across all enterprise accounts._

  - ❌ BAD — Acceptance criteria disguised as success metrics:

    > _Users can select interviewers from a dropdown. The calendar widget loads in under 2 seconds. Confirmation emails are sent automatically. All unit tests pass._

### Open questions

Decisions that haven't been made yet. Each should have concrete options, not open-ended prompts. If a question would block the team from starting delivery, resolve it first.

- ✅ GOOD — Concrete options with an owner:

  > _Do we support recurring availability preferences or just one-time slots in MVP?_ — Options: recurring from day one, one-time only in MVP — Owner: [PM]

- ❌ BAD — Open-ended question with no options or owner:

  > _How should we handle scheduling conflicts? We need to figure out the right approach here. TBD._

</solution-definition-template>

## Relationship to other artifacts

This Solution Definition is the PM's discovery artifact. It sits between two other documents in the delivery chain:

**Above:** The parent **Opportunity** in JPD frames the problem and desired outcome. The Solution Definition references it but does not duplicate it.

**Below:** **Epic PRDs** in Jira define concrete milestones with acceptance criteria, BDD scenarios, implementation decisions, and testing strategy. The Solution Definition provides context for Epics but does not prescribe how engineering breaks down the work.

The Solution Definition gets embedded in the Atlassian Project as a north star. It should be readable in under 3 minutes and answer: _"Why are we doing this, what are we building, how will we know it worked?"_
