---
name: pr-description
description: Generate professional pull request descriptions from branch diffs. Use when the user asks to create, write, update, or improve a PR description, or when creating a pull request with gh pr create.
---

# PR Description

Generate concise, professional PR descriptions that explain why, what, and how.

## Workflow

1. **Gather context** — run in parallel:
   - `git log --oneline $(git merge-base <default-branch> HEAD)..HEAD` for commit history
   - `git diff $(git merge-base <default-branch> HEAD) HEAD --stat` for file scope
   - `git diff $(git merge-base <default-branch> HEAD) HEAD -- <source-dirs>` for actual changes
   - Check for a PR template (`.github/pull_request_template.md` or similar)

2. **Analyze changes** — read ALL commits on the branch, not just the latest. Group related changes into logical themes.

3. **Write the description** — follow structure, tone, and formatting rules below.

4. **Apply** — use `gh pr edit <number> --body` or `gh pr create --body` with a HEREDOC.

## Structure

**Always use the repo's PR template if one exists.** Fill in every section the template provides. If no template exists, use this fallback:

```markdown
### Description

[Why this change exists. State the problem, then the approach. 2-3 sentences max.]

### Changes

1. **Short label** — what changed and why, in one sentence.
2. ...

### Checklist

- [ ] I have tested the changes
- [ ] Updated the tests
```

### Required Sections

**Description** — explain WHY these changes exist. State the user-facing problem or root cause first, then the approach taken to solve it. Keep it to 2-3 sentences.

**Changes** — numbered list. Each item explains WHAT changed and HOW. One sentence per item. Bold label + em dash + explanation.

**Checklist** — use the template's checklist. Check off items that were completed.

### Optional Sections

Add only when relevant:

- **Validation** — when significant manual or automated testing was done. Summarize by category (not individual test IDs). Use bold labels with em dashes for each category.
- **Notes** — for non-obvious details, caveats, or things reviewers should pay attention to. Use [GitHub alerts](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts):

  ```
  > [!NOTE]
  > Useful information that users should know, even when skimming content.

  > [!TIP]
  > Helpful advice for doing things better or more easily.

  > [!IMPORTANT]
  > Key information users need to know to achieve their goal.

  > [!WARNING]
  > Urgent info that needs immediate user attention to avoid problems.

  > [!CAUTION]
  > Advises about risks or negative outcomes of certain actions.
  ```

For full GitHub markdown formatting reference, see [basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

## Tone & Style

- **Professional and direct.** No filler, no hedging, no self-congratulation.
- **Lead with WHY in Description, WHAT+HOW in Changes.** Don't mix them.
- **One sentence per change.** Bold label + em dash + single-sentence explanation. No sub-bullets.
- **Use precise technical language.** Name the specific functions, hooks, components, and patterns. Reviewers skim — specificity helps them find what matters.
- **Concise.** Every sentence must earn its place. If the diff already shows it, don't repeat it.

## What to Avoid

- Repeating the ticket title as the description.
- Listing files changed (the diff does that).
- Explaining how the language/framework works.
- Passive voice ("it was decided that...").
- Vague labels ("Various improvements", "Code cleanup", "Minor fixes").
- Sub-bullet lists under numbered changes.
- Describing what you did instead of what the code does now.

## Examples

### Good Description opening

```
When navigating between insights, users experienced stale data flashes and
unnecessary loading spinners. The root cause: `useInsightData` returned
`viewInsightData` without verifying it matched the currently selected insight
type, and `useGetInsightByType` had no initial data from the parent cache —
forcing a full loading cycle on every navigation.

This PR eliminates those UX issues by aligning the returned data with the
active insight type, seeding per-type queries from the parent cache, and
fixing several performance pitfalls that caused unnecessary re-renders.
```

### Bad Description opening

```
This PR makes several improvements to the insights panel navigation experience.
```

### Good change item

```
1. **Type-aligned data via `useMemo`** — `useInsightData` returns a memoized
   value that guards against type mismatches: if `viewInsightData` belongs to
   a different type, it falls back to `queryInsightData || initialInsightData`
   instead of flashing stale content.
```

### Bad change item

```
1. Updated the useInsightData hook to use useMemo for better performance and
   to fix a bug where the wrong data was showing.
```

### Good Validation section

```
### Validation

22 scenarios tested across 8 categories against `demo-server` + `demo-app`
(full matrix in `test-plan-insights-navigation-ux.md`):

**Navigation UX** — Insight-to-insight switches are instant (no transition
animation); home-to-insight preserves the view transition; back navigation
works correctly.

**Cache seeding** — Insights render immediately from seeded cache (no spinner);
`data: [{}]` shows empty state; `hasSeedInsightData` prevents double-spinner.
```

### Good Note

```
> [!NOTE]
> The `initialData` query key for the parent cache lookup was also fixed —
> it was missing `jobId` in the key tuple, which would have caused cache misses.
```
