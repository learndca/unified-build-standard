# Running the standard in each tool

The standard itself is the same everywhere. This file says how to carry it out in specific tools. Tool features change: if something here does not match what the tool offers, use what the tool offers and tell me.

## Any tool: the handoff instruction

Every tool that can read files can execute a step. Give it:

> Read `build-plan/README.md`, then carry out `build-plan/steps/P1-S02.md` exactly, and fill in its Report section.

For a whole phase:

> Read `build-plan/README.md`. Carry out every step in Phase 2 of `build-plan/PLAN.md` in order, using the work order for each in `build-plan/steps/`.

The project's `AGENTS.md` and `CLAUDE.md` each carry one line pointing at `build-plan/`, so a tool that reads those files finds the folder without being told.

## Model tiers

The tiers in `PLAN.md` are capability levels, not fixed model names. A reasonable mapping today:

| Tier | Claude Code | Other tools |
| --- | --- | --- |
| Economy | A subagent on the Haiku model | Kimi, or the smallest Codex model |
| Standard | A subagent on the Sonnet model | The default Codex model |
| Strong | The main session on the most capable model | The most capable model available |

Change the mapping whenever prices or models change. The plan does not need to change.

## Claude Code

**Planning.** Use the most capable model for the goal, the plan and the work orders.

**Executing cheaper steps.** Start a subagent with the model for the step's tier and give it the handoff instruction above. The work order is the brief: do not retype it. Do the step yourself when it is quick or needs what you already know.

**Unattended runs.**

- The `/goal` command keeps a session working until a condition is met. It is typed by the owner. Suggest the exact text, built from `GOAL.md`, and include a turn limit because `/goal` has none of its own. Example: `/goal The measure in build-plan/GOAL.md meets its target, or 40 loops have run, or a stop condition in GOAL.md is reached.`
- `/goal` judges only from what appears in the conversation. Print the measure's result after each loop so it can see progress.
- Permission prompts stop an unattended run. Auto mode approves routine actions; suggest the owner turns it on for the run. Do not suggest bypassing permissions.
- On a Mac, keep the machine awake for the run: `caffeinate -ims -t <seconds>` in the background.
- If the project has uncommitted work that is not yours, do the run in a git worktree so the owner's files are not disturbed.
- For a run that must continue with the laptop closed, a cloud scheduled task can run the build on a schedule (minimum interval one hour). It works on a fresh clone and pushes a branch, so the push must be named as allowed in `GOAL.md`.

**Monitoring.** `build-plan/LOG.md` and the "Now" section of `PLAN.md` are the record. If the owner wants to watch from a phone, offer to publish the log as a private page and update it as the run goes. Send a push notification when the run ends, if that is switched on.

**The final check.** Start a fresh subagent. Give it `build-plan/GOAL.md` and the list of changes (the commits or the diff). Do not give it your summary or your opinion of the result. Ask it to run the measure and report where the result falls short of the goal.

**Long sessions.** When the conversation is compressed, re-read `GOAL.md` and the "Now" section of `PLAN.md` before continuing. State lives in the files, not in the conversation.

## Codex

- Codex reads `AGENTS.md`, so it finds `build-plan/` from the pointer line.
- Skills installed in `~/.agents/skills/` are available to it.
- For a run without interaction: `codex exec "<the handoff instruction>"`.

## Kimi

- Kimi Code reads `AGENTS.md` in the project root and loads skills from `~/.agents/skills/`.
- Give it the handoff instruction. It suits Economy steps with complete work orders.

## Handing back

Whichever tool executes a step, the result comes back through the files: the Report section of the work order, the step's row in `PLAN.md`, and a line in `LOG.md`. The next model, or the planner, reads those instead of asking what happened.
