# Systematic Reduction

The nuclear option for stubborn bugs. Instead of guessing what's causing the bug, remove everything that *isn't* causing it. It always works given enough patience.

## Setup

Create a new branch for this work. You'll be making destructive edits and committing them as you go.

## The Loop

1. Run the repro → verify the bug is present
2. Remove something from the code (a component, an event handler, a style, a condition, an import, a wrapper)
3. Run the repro again
4. **Bug still there** → **commit** the removal. The thing you removed wasn't the cause.
5. **Bug gone** → that removal is relevant. **Revert it**, then try removing a *smaller* piece of what you just reverted.
6. Repeat.

## The Cardinal Rule

**Always maintain a checkpoint where the bug exists.** Every committed state must still exhibit the bug. Progress is monotonic — the repro surface gets smaller with every commit. You are converging on the cause.

Think of it like well-founded recursion: every step must bring you strictly closer to the answer. If you find yourself with a bunch of test cases that *don't* exhibit the bug and no case that *does*, you've lost the thread. Go back to the last commit where the bug was present and try a different reduction.

## The Theory Trap

Forming a theory mid-reduction and creating an isolated test case to prove it is fine as a side investigation. But if it doesn't pan out, come back to the systematic reduction. Don't abandon your shrinking repro for a shiny theory. The reduction is slower but it's guaranteed to converge — theories are fast but they can lead you in circles.

## Endgame

At some point, you'll have removed everything except the minimal code that triggers the bug. The cause will be staring at you — either a mistake in your code, or a bug in a dependency.
