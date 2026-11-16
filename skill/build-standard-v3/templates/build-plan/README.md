# How to work in this folder

This folder is the record of the current build in this project. If you are a model or a person about to do work here, read this page first. It is all you need, even without the full build standard.

## The files

| File | What it is |
| --- | --- |
| `GOAL.md` | What we are building, how success is measured, the limits, and when to stop |
| `PLAN.md` | Current status at the top, then every step in plain English |
| `LOG.md` | One line for every loop of work, added as it happens |
| `steps/` | One work order per step, with the full technical instructions |
| `archive/` | Earlier builds. Ignore unless asked. |

## If you were asked to carry out a step

1. Read `GOAL.md`. Note what is **Protected** and what is **Not allowed**.
2. Read your work order in `steps/`. Read only the files it lists.
3. Do exactly what the work order says. Do not redesign it and do not add extras.
4. Run the check in the work order.
5. **If the check passes:** keep the change. Commit it only if `GOAL.md` allows commits, and commit only the files you changed.
6. **If the check fails:** you may try once more with a different idea. If it fails again, undo your own change, and stop. Mark the step "Blocked: needs a stronger model" and say what you tried.
7. Fill in the Report section at the bottom of the work order.
8. In `PLAN.md`, update the step's Status and Result, and the "Now" section at the top.
9. Add one line to the end of `LOG.md`. Never edit earlier lines.

## Rules that always apply

- Never edit the measure, the acceptance checks or anything listed as Protected in `GOAL.md`.
- Never report a check or result you did not see happen. If a check could not run, write "not verified" and why.
- Never present a placeholder, a mock or a skipped test as finished work.
- Changes that were already in the project before you started belong to the owner. Do not reset, discard or commit them.
- Stop and ask the owner before: deleting data, deploying, pushing, spending money, sending anything to people or outside services, or changing access or secrets. The only exceptions are actions that `GOAL.md` lists as allowed.
- Do not put passwords, keys or tokens in any file, commit or message.
- Write everything in `PLAN.md` and `LOG.md` in plain English. The owner reads them and is not a programmer.
- Use GMT for every time you record. Get it with `date -u`.

## If the work order is wrong

If something the work order relies on does not exist, or following it would break something, do not improvise a different design. Stop, mark the step Blocked in `PLAN.md`, and write what you found in the Report section.
