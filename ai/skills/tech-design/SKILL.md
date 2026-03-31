---
name: tech-design
description: >
  Create a structured tech design document for a feature or service. Use this skill when the user
  wants to write a tech design, architecture doc, design doc, technical spec, or RFC. Also trigger
  when the user says things like "let's design this", "write up the design", "I need a tech design
  for...", "document the architecture", or "create a design doc". If the user has been exploring a
  codebase or discussing a feature and then wants to formalize the plan, this is the right skill.
  Even if the user just says "design" in a technical context, consider triggering.
---

# Tech Design Skill

Create a comprehensive tech design document based on the team's template. The output is a markdown file at `<project-root>/tech-designs/<design-name>.md`.

## When this skill triggers

Typically the user has already gathered context — they may have explored the codebase (e.g. via `/explore`), attached a Jira ticket, or described the feature in conversation. Your job is to take that context and turn it into a structured, reviewable design document.

## Process

### 1. Gather Context

Before writing anything, make sure you have enough information to produce a useful design. Pull from these sources:

**Conversation history** — The user likely already discussed the feature, shared a ticket, or explored code. Extract everything relevant: the problem, scope, constraints, prior decisions.

**Codebase exploration** — Actively investigate the repo to understand:
- Existing module structure and boundaries
- Relevant DB schemas, models, migrations
- API routes and contracts
- UI component hierarchy (if applicable)
- Shared libraries and utilities that will be affected
- Test patterns in use

**External tools** — Use whatever is available to fill gaps:
- `acli` for Jira ticket details (acceptance criteria, linked issues)
- `agent-browser` for Figma mocks, wiki pages, or any browser-accessible resource
- MCP servers (Figma, Slack, etc.) if connected
- `gh` for related PRs, issues, or discussions

**Ask the user** only for things you genuinely can't find or infer. Don't ask questions you can answer by reading the code.

### 2. Write the Design Document

Follow the template structure below. Every section matters, but depth should be proportional to complexity — a small feature doesn't need 10 diagrams.

#### Principles

- **Show, don't just tell.** Use ANSI flowcharts for control flow, sequence diagrams for cross-service communication, block diagrams for module relationships. A good diagram replaces paragraphs of prose.
- **Code sparingly.** Only include code snippets when they clarify an interface, a schema change, or a tricky algorithm. Keep them minimal — this is a design doc, not a PR.
- **Screenshots when useful.** If there's a Figma mock or existing UI that's relevant, capture a screenshot via `agent-browser`. If you can't get one, leave a placeholder: `<!-- Screenshot: [description of what should go here] -->`.
- **Be opinionated.** Present your recommended approach clearly. If there are alternatives worth discussing, put them in the detailed design with explicit tradeoffs — but make it clear which one you're recommending and why.
- **MVPs matter.** Call out what's MVP vs. future scope. The reader should know what ships first.

#### ANSI Flowcharts

Use fenced code blocks with ANSI box-drawing characters for flowcharts. They render cleanly in any markdown viewer and don't depend on external tools.

Example — a decision flow:

```
                    ┌─────────────────┐
                    │  Request comes  │
                    │      in         │
                    └────────┬────────┘
                             │
                    ┌────────▼────────┐
                    │  Authenticated? │
                    └───┬─────────┬───┘
                    Yes │         │ No
                  ┌─────▼───┐ ┌──▼──────────┐
                  │ Process  │ │ Return 401  │
                  │ request  │ │             │
                  └─────┬────┘ └─────────────┘
                        │
                  ┌─────▼────────┐
                  │  Return 200  │
                  └──────────────┘
```

Example — a sequence diagram:

```
  Client          API Gateway        Auth Service        DB
    │                  │                   │               │
    │  POST /login     │                   │               │
    │─────────────────►│                   │               │
    │                  │  validate token   │               │
    │                  │──────────────────►│               │
    │                  │                   │  lookup user  │
    │                  │                   │──────────────►│
    │                  │                   │◄──────────────│
    │                  │◄──────────────────│               │
    │  200 + JWT       │                   │               │
    │◄─────────────────│                   │               │
```

Use these styles as needed. Adapt the complexity to the feature — don't force a sequence diagram when a simple flow suffices.

#### Minimal Code Examples

When you include code, keep it focused on the interface or contract — not the implementation:

```typescript
// New endpoint — POST /api/v1/feature
interface CreateFeatureRequest {
  name: string;
  config: FeatureConfig;
}

interface CreateFeatureResponse {
  id: string;
  status: 'active' | 'pending';
}
```

For DB changes, show the schema diff:

```sql
-- Add to features table
ALTER TABLE features
  ADD COLUMN config JSONB NOT NULL DEFAULT '{}',
  ADD COLUMN activated_at TIMESTAMPTZ;
```

### 3. Document Template

Read `references/template.md` for the full template structure. The output document should start with:

```markdown
# <Feature/Service Name> — Tech Design

**Author:** [user's name if known, otherwise leave blank]
**Date:** [today's date]
**Status:** Draft

---
```

Then follow every section from the template. Omit sections only if they're genuinely irrelevant to the feature (e.g., no DB changes means skip "DB Changes").

### 4. Save the File

- Create `tech-designs/` at the project root if it doesn't exist.
- Filename: kebab-case derived from the feature name, e.g. `tech-designs/user-authentication-redesign.md`.
- After writing, tell the user the path and give a brief summary of what you covered and what gaps remain (open questions, missing screenshots, areas that need their input).
