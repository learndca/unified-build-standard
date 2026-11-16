# Planning: the goal, the plan table and work orders

Read this before writing `GOAL.md`, `PLAN.md` or any work order.

Spend on planning only what it will save in building. The plan is the default route, not a script: section "Changing the plan" below says when you may adjust it.

## 1. Investigate first

Look before you plan, and change nothing while you look. Start with the sources that tell you most for least effort:

1. `AGENTS.md`, `CLAUDE.md` and the `README`
2. Configuration, manifests, schemas and migrations
3. The files closest to the behaviour being changed
4. Existing tests
5. The current branch and recent commits

Ask me only about intent: what I want and why. Find facts yourself.

Keep facts and guesses apart. Never present a file, command, API or capability as real unless you saw it. If something cannot be checked cheaply now, write it in the work order as:

> **Check first:** [what is uncertain] — [the cheapest way to find out]

If the uncertainty could change the whole approach, settle it before asking for go.

## 2. Writing the goal

A good goal can be checked by running something and reading the answer.

| Kind of work | A measure that works |
| --- | --- |
| Speed, size, cost, error counts | One command that prints the number |
| A new feature | A list of acceptance checks, each written as something a person can see: "Saving a scenario and reloading the page shows the saved scenario" |
| A fix | The failing case, shown failing before and passing after |
| Data work | A reconciliation: counts or totals that must match |

Rules for the measure:

- Run it before planning and record the baseline with the date.
- Say exactly how to run it, so any model gets the same answer.
- It is protected. Nobody edits the measure or the acceptance checks during the build. If a check is wrong, that is a change for me to approve.
- For acceptance checks, record each as pass or fail in `GOAL.md`. The score is passed out of total.

Stop conditions keep an unattended run from going on without progress. Sensible defaults when I do not give any: stop after 40 loops, or after 5 loops in a row with no gain.

## 3. Writing the plan table

`PLAN.md` is my window into the work. I read it without knowing the code.

- Group steps into phases, normally 3 to 6. Each phase ends with something I can see or try.
- Give every step a stable ID: `P1-S01`, `P1-S02`, `P2-S01`. Never renumber. Add new IDs for new steps.
- One outcome per step. If a step needs "and", consider splitting it.
- Write every cell in plain English. If a technical word is unavoidable, explain it in a few words the first time.
- **What it does:** the action, as I would describe it.
- **Why it matters:** what it gets me, or what goes wrong without it.
- **How we'll know it worked:** something observable, not "tests pass" alone. "The 12 checks for saving all pass, and a saved scenario survives a page reload."
- **Who does it:** Economy, Standard, Strong or Me (section 5).
- **Status:** Planned, In progress, Done, Blocked, Deferred or Cancelled. Cancelled needs a reason in the Result cell.
- **Result:** filled in after the step, with the evidence: the number, the check that passed, the commit.

If a step cannot be explained plainly, you probably do not understand it well enough yet. Investigate more.

Work that is useful but not needed for the goal goes under "Later", not in the steps.

## 4. Writing work orders

A work order is the technical half of a step. `PLAN.md` tells me what is happening; the work order tells the executor exactly what to do. Use `templates/build-plan/steps/STEP_TEMPLATE.md`.

Write for a reader with less context and less reasoning ability than you, who has not seen the planning conversation. The test for every work order:

> Can the named executor finish this from the work order alone, without rediscovering or redesigning anything?

If not, add what is missing, split the step, or raise the tier.

Good instructions:

1. Open `src/auth/session.ts` and find `validateSession()`.
2. Add an expiry check after the signature check and before the user lookup.
3. Reuse the existing `SessionValidationError`.
4. Add three cases to `tests/auth/session.test.ts`: expired, valid, malformed.
5. Run `npm test -- session`. Then run `npm test -- auth`.
6. Done when both pass and an expired session returns 401.

Bad instructions: "Update authentication and test it."

Each work order names the files to read, the files to change, what to leave alone, the exact check command with the result to expect, and when to stop and hand back. Keep the context list short: an executor that reads less costs less and drifts less.

**When to write them.** Write the work orders for the phase that is about to run. Write a later phase's work orders when you reach it, because earlier results change them. If a cheaper model will run the whole build without you, write them all before handing over.

## 5. Choosing who does a step

| Tier | Suits |
| --- | --- |
| **Economy** | Exact edits, boilerplate, formatting, simple configuration, narrow tests, anything fully spelled out |
| **Standard** | Changes across several files, integration, bounded debugging, adapting an existing pattern |
| **Strong** | Design decisions, unclear problems, hard diagnosis, security-sensitive work, risky migrations |
| **Me** | Approvals, intent, credentials, anything only the owner can do |

Pick the cheapest tier that will do the step reliably. Do not give Economy a step that still needs discovery. Do not give Strong a step just because Strong is available. `references/tools.md` maps the tiers to real models.

## 6. Check the plan before showing it

- The steps are enough to reach the target, and none is unnecessary.
- Every step has a check that produces evidence.
- Every row reads clearly to a non-programmer.
- Every first-phase step has a work order that passes the test in section 4.
- Anything risky or needing my approval is named in `GOAL.md`.
- A fresh session could start from the `build-plan/` folder alone.

## 7. Changing the plan

Adjust a step without asking when the goal, the measure, the scope, the cost and the risk all stay the same, and the change can be undone. Record it under "Decisions and changes" in `PLAN.md` with the date and the reason.

Ask me first when the change alters what is being built, how it is measured, the scope, the cost or the risk. In an unattended run, write it under "Needs you", park the affected steps, and continue with the rest.

## 8. Reports

**Phase report (Gated mode).** Short and plain:

1. What this phase achieved, with the measure before and after.
2. What was checked and how.
3. What did not go to plan.
4. What the next phase will do.
5. Anything I must decide.

**Final report.** Lead with whether the goal was met and the numbers. Then what changed for the user of the product, what was checked, what fell short, and decisions for me. Point to `build-plan/PLAN.md` and `build-plan/LOG.md` for detail instead of repeating them.
