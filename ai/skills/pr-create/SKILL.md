---
name: pr-create
description: Help author a well-structured pull request. Use when user wants to create a PR, open a pull request, write a PR description, split commits, organize changes for review, prepare code for merge, or asks "how should I structure this PR". Also triggers when user has a large branch and wants help breaking it into reviewable chunks or stacking PRs.
allowed-tools: Bash, Read, Glob, Grep, Edit
user-invocable: true
---

# PR Create

You help the author prepare their changes for review — writing clear PR descriptions, splitting oversized branches into reviewable chunks, self-reviewing before requesting teammates, and structuring commits so the PR tells a coherent story.

The goal: make your reviewer's job easy. A PR that's easy to review gets reviewed fast, reviewed thoroughly, and merged with confidence. A PR that's hard to review gets procrastinated on, skimmed, and rubber-stamped — which helps nobody.

## Workflow

When invoked, figure out what the user needs. They might want:
- A PR description for their current branch
- Help splitting a large branch into smaller PRs
- A self-review of their changes before requesting teammates
- Commit reorganization suggestions
- All of the above

Start by understanding the current state:

```bash
# What branch are we on, what's the base?
git branch --show-current
git log --oneline main..HEAD  # or master — check which exists

# What changed?
git diff --stat main..HEAD
git diff main..HEAD

# Any uncommitted work?
git status
```

Then proceed based on what the user needs.

---

## 1. Self-Review

Before anyone else sees this code, review it yourself. This catches the embarrassing stuff and — more importantly — gives you a chance to annotate the non-obvious parts.

Go through `git diff main..HEAD` file by file. Flag:

- **Leftover debug code** — console.logs, debugger statements, commented-out blocks, TODO comments without issues
- **Accidental inclusions** — lock file changes, unrelated formatting, files that shouldn't be committed
- **Non-obvious changes** — anything where a reviewer would ask "why?" deserves either a code comment or a note in the PR description
- **Missing tests** — new behavior without test coverage, edge cases unhandled
- **Hard-coded values** — magic strings, URLs, credentials, timeouts that need explanation
- **Mixed concerns** — is this PR doing more than one thing? (see section 3)

Present findings as a checklist the user can act on before opening the PR.

---

## 2. PR Description

Write a clear PR description using the diff and commit history. The description should help a reviewer understand **what** changed and **why**, without having to read every line first.

### Structure

```markdown
## What

[1-3 sentences: what this PR does in plain language. Not a list of files changed — the actual behavior change from a user's or system's perspective.]

## Why

[The motivation. Link to the issue/ticket if there is one. What was broken, missing, or needed? Why now?]

## How

[Brief explanation of the approach. Especially useful when the "how" isn't obvious from the diff — e.g., "Chose X over Y because of Z constraint." Mention tradeoffs if any.]

## Testing

[How was this tested? Manual steps, new automated tests, existing test coverage. If there's a feature flag, mention it and the rollout plan.]

## Notes for reviewers

[Optional. Call attention to specific files or decisions. "The change in `auth.ts` is the core logic — the rest is plumbing." or "I know the migration is large, it's auto-generated." Point reviewers to the interesting parts.]
```

Adapt the template to fit — a 5-line bug fix doesn't need all sections. A one-liner can just be a sentence. Don't pad.

### Good PR descriptions

- Reference related issues: `Fixes #123` or `Part of #456`
- Mention if this is part of a larger effort and link sibling PRs
- Include before/after screenshots for UI changes
- Note any deploy dependencies (migrations, env vars, feature flags)
- Call out risks: "This changes the auth flow — if something goes wrong, disable the `new_auth` flag"

### Bad PR descriptions

- Empty or just the branch name
- Restating the diff ("Updated file X, added function Y")
- Walls of text that nobody will read

---

## 3. Splitting Large PRs

A PR with 500+ lines of meaningful changes (not counting generated code, lock files, snapshots) is too large for a thorough review. The reviewer will either skim it or procrastinate on it. Neither outcome is good.

### When to suggest splitting

Analyze the diff and flag if you see:
- **Mixed concerns** — refactoring + new feature + test changes that could land independently
- **Layered architecture** — data model + API + UI that could be introduced bottom-up
- **Multiple independent fixes** bundled together

### How to split: the daisy-chain approach

The idea: you don't have to think in small PRs while building. Build the whole thing in one branch, then tease it apart.

1. **Identify the layers.** Look at the diff and find natural boundaries:
   - Data model / schema changes (land first — everything else depends on these)
   - Core logic / new methods with tests (safe to land if nothing calls them yet)
   - API endpoints / controllers that use the new logic
   - UI that exposes the new endpoints
   - Polish / UX improvements

2. **Suggest a stacking order.** Present it as a chain:
   ```
   main ← pr-1-schema ← pr-2-core-logic ← pr-3-api ← pr-4-ui
   ```
   Each PR is based on the previous one, not on main. This means each PR's diff is small and focused.

3. **Provide the git commands.** For each suggested split, give concrete cherry-pick or checkout instructions:
   ```bash
   # Create the first focused branch
   git checkout main
   git checkout -b pr-1-schema
   git cherry-pick <commit-hashes>  # or manual extraction

   # Create the next branch, based on the first
   git checkout pr-1-schema
   git checkout -b pr-2-core-logic
   git cherry-pick <commit-hashes>
   ```

4. **Explain the merge flow:**
   - Open PR-1 against `main`, PR-2 against `pr-1-schema`, etc.
   - Keep downstream PRs as **drafts** until their base is merged
   - When PR-1 merges into main, update PR-2's base to `main`
   - This avoids the "accidentally tagged every team" problem from merging main into a mid-chain branch

### When NOT to split

- The PR is already small and focused
- Splitting would create PRs that don't make sense in isolation
- The changes are tightly coupled and splitting would require duplicating code

---

## 4. Commit Organization

Review the commit history and suggest improvements if needed.

### Good commits

- Each commit compiles and tests pass (bisectable)
- Message says **why**, not just what: "Handle empty input in parser" > "Update parser.ts"
- Related changes grouped together: the test and the code it tests in the same commit

### Suggest reorganization when you see

- **WIP/fixup commits** that should be squashed: "wip", "fix", "oops", "trying again"
- **Huge monolithic commits** that could be broken up by concern
- **Interleaved concerns** — commit 1 does A+B, commit 2 does more A+B, when A and B are independent

Provide specific `git rebase -i` guidance with the exact commit hashes and what to squash/reorder. But warn about the tradeoffs: interactive rebase rewrites history. If the branch is shared or has open reviews, it can cause problems. In that case, suggest a fixup commit instead.

---

## Output

After analysis, present:

1. **Self-review findings** — checklist of things to address before opening
2. **Draft PR description** — ready to paste into GitHub
3. **Split suggestions** — if the PR is large, a concrete stacking plan with commands
4. **Commit notes** — any reorg suggestions

Use GitHub-flavored markdown throughout. The PR description should be ready to copy-paste — use proper heading levels (`##` not `#` since the PR title is the `#`), reference syntax (`Fixes #123`), and task lists (`- [ ]`) where appropriate.
