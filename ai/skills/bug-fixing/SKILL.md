---
name: bug-fixing
description: Systematic bug-fixing workflow that requires reproduction before any fix. Use when the user reports a bug, asks to fix an issue, debug a problem, or investigate unexpected behavior. Enforces a reproduce-first, verify-after discipline. Also use when the user says something is "broken", "not working", "weird behavior", or asks "why is this happening".
---

# Bug Fixing

Reproduce first. Fix second. Verify always.

The single most common mistake in debugging — whether by humans or AI — is skipping reproduction and jumping straight to a fix. Without a repro, you're guessing. You'll confidently declare the bug "fixed" when it isn't, because you have no way to verify. Every step below exists to prevent that.

## Workflow

### 1. Understand the Bug

Read the bug description, error messages, and relevant code. Establish three things clearly:

- **Expected behavior** — what should happen
- **Actual behavior** — what is happening instead
- **Trigger** — what action or condition causes the actual behavior

If any of these are unclear, ask the user before proceeding. A vague bug report leads to a vague fix.

### 2. Find a Reproducible Case

A repro is a sequence of steps that reliably produces the bug. "Reliably" is key — if it only happens 30% of the time, you'll need to either eliminate sources of uncertainty (mock the network, fix the seed, control timing) or accept slower iteration.

Pick a strategy based on bug type:

| Bug type   | Reproduction strategy                                                         |
| ---------- | ----------------------------------------------------------------------------- |
| UI/visual  | `agent-browser open <url>`, then `agent-browser snapshot -i` to observe state |
| Logic/data | Write a minimal failing test or script                                        |
| API        | Execute the request, inspect response                                         |
| State      | Add logging, trigger the flow, read output                                    |
| Timing     | Add timestamps/console.logs at key points, trigger the flow                   |

**For UI bugs with agent-browser:**

```bash
agent-browser open <url>
agent-browser snapshot -i        # get interactive elements
agent-browser click @e1          # trigger the bug
agent-browser snapshot -i        # observe broken state
```

Capture evidence: screenshots, console output, test failures, or diffed values.

**When the user's repro doesn't work for you:** Sometimes the user can see the bug (visual jitter, flicker, layout shift) but you can't observe it programmatically. That's fine — you need to trade their repro for one you *can* verify. Measure something concrete: a scroll position, a DOM element's presence, a state value, a network response. See step 3.

### GATE: Can you reproduce it?

- **Yes** → continue to step 3
- **No** → **STOP.** Report:
  - What you tried
  - What you observed
  - What information is missing to reproduce

Do not guess. Do not "fix" what you can't see.

### 3. Narrow the Repro

A good repro is fast, direct, and automatable. Trade a complex repro for a simpler one whenever possible — faster iteration means faster fixes.

**But validate the trade.** This is critical. When you swap one repro for another, you risk capturing a different problem entirely. You must confirm correlation in both directions:

1. **Confirm the new repro fails** when the bug is present (the current state)
2. **Apply a known workaround** (e.g., comment out the suspected code) and **confirm the new repro passes**
3. **Undo the workaround** and confirm it fails again

Toggle back and forth a few times. If the new repro doesn't track the original bug in both directions, it's measuring something else. Discard it and try a different approach.

Why is this so important? If your new repro captures an unrelated problem, you could find the "right fix" for the real bug and your test would still say it's broken. You'd dismiss the correct solution and keep searching. This is one of the most expensive debugging mistakes — hours wasted chasing a phantom.

### 4. Root Cause Analysis

Start with theories. Read the code path, trace the data flow, form hypotheses about what's going wrong. Test each theory.

**If your theories run out — use systematic reduction.** Read `references/systematic-reduction.md` for the full technique. The short version: create a new branch, remove code piece by piece, commit each removal only if the bug persists. Always maintain a checkpoint where the bug exists. The repro shrinks monotonically until the cause is isolated.

### 5. Fix

Apply the **minimal change** that addresses the root cause. One fix for one cause. Don't shotgun multiple changes hoping one of them works — you won't know which one actually fixed it, and the others may introduce new problems.

If the root cause is in a dependency (wrong version, known bug), fix the dependency. Check changelogs, release notes, and issue trackers.

### 6. Verify the Fix

Re-run the **exact reproduction** from step 2. The bug must be gone.

Then toggle the fix off (revert it temporarily) and confirm the bug comes back. Toggle it on again. This round-trip confirms your fix is actually what resolved it, not some other change or caching artifact.

For UI bugs:

```bash
agent-browser open <url>
agent-browser snapshot -i
agent-browser click @e1          # same action that triggered the bug
agent-browser snapshot -i        # confirm expected behavior
```

### 7. Check for Regressions

Run existing tests to make sure nothing else broke. If the bug didn't have a test before, add one — the repro you built in steps 2-3 is often most of the way to a regression test already.

## Anti-patterns

- **Fixing without reproducing** — you're guessing, and you'll confidently declare "fixed" when it isn't
- **Declaring "fixed" without re-running the repro** — you're hoping
- **Chasing theories without maintaining a failing case** — you'll end up with isolated test cases that don't exhibit the bug and no path back to one that does
- **Removing the symptom instead of the cause** — it'll come back, or manifest differently
- **Big bang fixes** — multiple changes at once make it impossible to know what actually fixed it
- **Trading repros without validating the trade** — you might spend hours solving a different problem
- **Giving up on reduction and falling back to guessing** — the reduction is tedious but it converges; guessing doesn't
