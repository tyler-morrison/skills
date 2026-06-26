---
name: to-prd
description: >
  Write a Product Requirements Document (PRD) and submit it as a Jira Epic.
  Use when user wants to write a PRD or plan a new feature.
argument-hint: Optional Solution ticket key (e.g. RD-42)
---

# To PRD

## Process

### 1. Gather context

Work from whatever is already in the conversation context.

<important if="arguments were passed into this skill">
Use $ARGUMENTS[0] to fetch the parent Solution ticket via Atlassian MCP.
</important>

### 2. Explore the codebase (optional)

If you have not already explored the codebase, do so to understand the current state of the code.

### 3. Plan deep modules

Sketch out the major modules you will need to build or modify to complete the implementation.

Actively look for opportunities to extract **deep modules** that can be tested in isolation.

A deep module (as opposed to a shallow module) is one which encapsulates a lot of functionality in a simple, testable interface which rarely changes.

Check with the user that these modules match their expectations.
Check with the user which modules they want tests written for.

Create a Jira ticket using the Atlassian MCP using `projectKey: "GREEN"` as the default.

PRD tickets typically use `issueTypeName: "Epic"`, but prefer `issueTypeName: "Initiative"` when the scope of the feature requires a mulit-phase plan.

Include the following custom fields by default — pass them in `additional_fields`:

```json
{
  "customfield_10700": { "value": "Post-Hire Ecosystem" },
  "customfield_11900": { "id": "19c2cd93-cb4e-46af-a8cb-37a64c1e3ec4" }
}
```

## Template

<prd-template>
Start with a 1-2 sentence elevator pitch for this work. Why does it matter?

> _Example: Today, customers have to manually reconcile support tickets across three systems, costing 15+ hours per week. This Epic delivers automated ticket sync, eliminating manual work and reducing errors._

## Problem Statement

The problem that the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## User Stories

A LONG, numbered list of user stories. Each user story should be in the format of:

1. As an <actor>, I want a <feature>, so that <benefit>

<user-story-example>
1. As a mobile bank customer, I want to see balance on my accounts, so that I can make better informed decisions about my spending
</user-story-example>

## Implementation Decisions

A list of implementation decisions that were made. This can include:

- The modules that will be built/modified
- The interfaces of those modules that will be modified
- Technical clarifications from the developer
- Architectural decisions
- Schema changes
- API contracts
- Specific interactions

Do NOT include specific file paths or code snippets. They may end up being outdated very quickly.

## Testing Decisions

A list of testing decisions that were made. Include:

- A description of what makes a good test (only test external behavior, not implementation details)
- Which modules will be tested
- Prior art for the tests (i.e. similar types of tests in the codebase)

## Out of Scope

A description of the things that are out of scope for this PRD.

## Outstanding Questions

Unresolved decisions with owners and target dates.

## Further Notes

Any further notes about the feature.

</prd-template>
