# Tech Design Template

## Purpose

One sentence: what this feature/service does and where it lives.

Example: "This document describes the architecture/proposed solution of a <feature name> in <module name>."

## Background

Context and motivation — why this needs to exist.

- What problem are you solving?
- What's the current state? (include a diagram if it helps)
- What's explicitly out of scope?
- Mark MVP boundaries where relevant.

Do not describe the solution here — that's the next section.

## Requirements

High-level description of what needs to change — modules to add, modify, or remove.

Include a block diagram showing the proposed architecture at a glance. Help the reader understand the full picture without diving into implementation details.

Do not include implementation details here — that's the next section.

## Detailed Design

The longest section. Break down by module/area. For each:

### <Module/Area Name>

Why changes are needed here, plus:

- **Diagrams** — flowcharts, sequence diagrams, block diagrams. Use ANSI box-drawing in fenced code blocks. Add a title to every diagram and highlight what's changing.
- **Code examples** — only when they clarify an interface, schema, or contract. Keep them minimal.
- **Screenshots** — from Figma, existing UI, etc. Use `<!-- Screenshot: [description] -->` as placeholder if unavailable.

#### API Changes

Endpoints: action (create/update/delete), URL, method, payload, responses (code + data).

#### DB Changes

Database name, table, schema changes.

#### UI Changes

Component diagrams, integration points between components. Include Figma mocks or screenshots.

#### Library/Shared Changes

What changes, dependents, downstream impact.

### Alternatives Considered

Other approaches evaluated, with tradeoffs explaining why they were not chosen.

## Implementation Breakdown

Task list with estimates and dependencies. Highlight parallel work and cross-team dependencies.

| Task | Estimate | Dependencies | Notes |
|------|----------|-------------|-------|
| ...  | S/M/L    | ...         | ...   |

**S** = ~1 day, **M** = 2-3 days, **L** = 3+ days

## Testing Strategy

How you'll verify this works.

| Area | Test Type | Description |
|------|-----------|-------------|
| ...  | unit/integration/e2e | ... |

## Runbook

### Launch Plan
- Feature flag strategy
- Deployment steps

### Monitoring
- Dashboards and alerts
- Sanity checks (environment, timing)

### Troubleshooting
- Rollback plan
- Known failure modes and mitigations

## Open Questions & Concerns

Unresolved issues — status, owner, context.

| Question | Status | Owner | Notes |
|----------|--------|-------|-------|
| ...      | Open/Resolved | ... | ... |
