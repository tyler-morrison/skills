---
name: to-opportunity
description: >
  Turn the current conversation context into an Opportunity Statement and submit it to Jira Product Discovery (JPD).
  Use when user wants to frame a problem worth solving, write an opportunity statement, define a new product opportunity, or articulate an unmet customer need.
---

# To Opportunity

## Process

### 1. Gather context

Work from whatever is already in the conversation context.

### 2. Explore the codebase (optional)

If you have not already explored the codebase, do so to understand the current state of the code.

### 3. Quiz the user

If the user has described what they want to build, redirect to what's broken and why it matters.

Ask the user:

- What's broken, slow, painful, or missing for users today?
- Who specifically is affected and at what scale?
- What evidence do we have that this is real? Customer feedback, support patterns, churn signals, competitive pressure, usage data?
- What's the business impact of inaction? ARR at risk, pipeline blocked, retention dropping?
- What does the world look like if we solve this well, framed as a measurable change in behavior or business performance?
- Why now? What makes this urgent or timely?
- Are there constraints that shape the solution space without prescribing a solution?

### 4. Create the Jira ticket

Draft each section one at a time, using the template below.
Pause after each section for confirmation or clarifying questions.

The Opportunity Statement should be submitted as a JPD issue via Atlassian MCP with `issueTypeName: "Opportunity"` and `projectKey: "RD"` (or as specified).

## Template

<opportunity-statement-template>

### Problem

What's broken, slow, painful, or missing? Be concrete. Name the friction, not the feature. A good problem statement could inspire multiple solutions from different teams.

- ✅ GOOD — Names the friction, stays in problem space, could inspire multiple solutions:

  > _Recruiters spend 20+ minutes per candidate manually moving data between our scheduling tool and the candidate profile. The process is error-prone and doesn't scale for high-volume roles._

- ❌ BAD — Describes a solution disguised as a problem:

  > _We need to build an embedded scheduling widget in the candidate profile sidebar so recruiters don't have to switch tabs._

### Why this matters

Connect the problem to business outcomes. Why should the company invest here? What's the cost of inaction? Include hard numbers where you have them and qualitative signals where you don't.

- ✅ GOOD — Quantified impact, names specific evidence, connects to business outcomes:

  > _Scheduling friction is the #1 complaint in our latest NPS survey. Three enterprise prospects cited it as a blocker in recent sales cycles, representing $1.2M in pipeline. Support tickets related to scheduling errors have increased 35% quarter over quarter._

- ❌ BAD — Vague appeal to importance with no evidence:

  > _Scheduling is really important to our customers and we've heard a lot of feedback about it. Improving this would make the product much better and help us win more deals._

### Desired outcome

What does the world look like if we solve this well? Frame it as a measurable change, not a feature shipped. This becomes the benchmark the team measures Solutions against.

- ✅ GOOD — Measurable change in user behavior, no solution prescribed:

  > _Recruiters can schedule a full interview loop in under 5 minutes without leaving the candidate profile. Time-to-schedule drops by 60%._

- ❌ BAD — Describes a feature, not an outcome:

  > _Ship an integrated scheduling module with calendar sync, timezone detection, and availability preferences by Q3._

### Constraints the team should know

Anything that shapes the solution space without prescribing a solution. Leave empty if there aren't any meaningful constraints. Don't invent guardrails.

- ✅ GOOD — Real constraint that shapes the solution space without prescribing an approach:

  > _SOC 2 audit is in Q4. Any solution handling PII must pass security review before GA. Platform team is mid-migration to the new events infrastructure, so any solution must work with both old and new systems until Q3._

- ❌ BAD — Solution preference disguised as a constraint:
  > _We should use the Kombo API for this since it already has connectors for most HRIS providers. The team should build it in React with a GraphQL backend._

</opportunity-statement-template>

## Relationship to other artifacts

This Opportunity Statement is the top of the discovery hierarchy. It frames a problem worth solving without prescribing how to solve it.

**Below:** **Solution Definitions** in JPD propose specific approaches to address this Opportunity. Multiple Solutions can connect to the same Opportunity, enabling the team to evaluate alternatives before committing engineering resources.

**Further below:** **Epic PRDs** in Jira define concrete delivery milestones for the chosen Solution. The Opportunity Statement provides strategic context but does not prescribe delivery details.

The Opportunity Statement should be readable in under 2 minutes and answer: _"What's broken, why should we care, and what does good look like?"_
