---
name: to-issues
description: >
  Break a plan, spec, or PRD into independently-grabbable Jira tickets using tracer-bullet vertical slices.
  Use when user wants to convert a plan into issues, create implementation tickets, or break down work into issues.
argument-hint: Epic ticket key (e.g. GREEN-1234)
---

# To Issues

Break a plan into independently-grabbable Jira tickets using vertical slices (tracer bullets).

## Process

### 1. Gather context

Work from whatever is already in the conversation context.

<important if="arguments were passed into this skill">
Use $ARGUMENTS[0] to fetch the parent Epic ticket via Atlassian MCP.
</important>

### 2. Explore the codebase (optional)

If you have not already explored the codebase, do so to understand the current state of the code.

### 3. Draft vertical slices

Break the plan into **tracer bullet** issues. Each issue is a thin vertical slice that cuts through ALL integration layers end-to-end, NOT a horizontal slice of one layer.

Slices may be 'HITL' or 'AFK'. HITL slices require human interaction, such as an architectural decision or a design review. AFK slices can be implemented and merged without human interaction. Prefer AFK over HITL where possible.

<vertical-slice-rules>
- Each slice delivers a narrow but COMPLETE path through every layer (schema, API, UI, tests)
- A completed slice is demoable or verifiable on its own
- Prefer many thin slices over few thick ones
</vertical-slice-rules>

### 4. Quiz the user

Present the proposed breakdown as a numbered list. For each slice, show:

- **Title**: short descriptive name
- **Type**: HITL / AFK
- **Blocked by**: which other slices (if any) must complete first
- **User stories covered**: which user stories this addresses (if the source material has them)

Ask the user:

- Does the granularity feel right? (too coarse / too fine)
- Are the dependency relationships correct?
- Should any slices be merged or split further?
- Are the correct slices marked as HITL and AFK?

Iterate until the user approves the breakdown.

### 5. Create the Jira tickets

For each approved slice, create a Jira ticket using the Atlassian MCP.
Use the issue body template below.

<important if="you are creating a HITL slice">
The ticket should be `issueTypeName: "Story"`
</important>

<important if="you are creating a AFK slice">
The ticket should be `issueTypeName: "Agent Task"`
</important>

Include the following custom fields by default — pass them in `additional_fields`:

```json
{
  "customfield_10700": { "value": "Post-Hire Ecosystem" },
  "customfield_11900": { "id": "19c2cd93-cb4e-46af-a8cb-37a64c1e3ec4" }
}
```

Create issues in dependency order (blockers first) so you can reference real issue numbers in the "Blocked by" field. Each issue should be a child of $ARGUMENTS[0].

If $ARGUMENTS[0] was omitted, ask the user for the parent epic.

## Template

<issue-template>

### What to build

A concise description of this vertical slice. Describe the end-to-end behavior, not layer-by-layer implementation.

### Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

</issue-template>
