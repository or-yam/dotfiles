---
name: ralph-command
description: "Plan's task execution flow. Use when executing a task from the plan file, or when asking for plan execution"
---

Read the plan file and related documentations.
Choose the most relevant task from the plan (compare to the progress so far and what is doable).
Choose a SINGLE task.

1. Execute the task
2. Make sure CI checks passes (lint, format, tests)
3. If it's a UI task use browser tool to verify the changes
4. Review your changes compared to the plan.
5. use the /honest-review skill to review your changes and make sure they are up to the standards. If not, fix the issues and repeat the review until it passes.
6. Update the progress in the plan file.
