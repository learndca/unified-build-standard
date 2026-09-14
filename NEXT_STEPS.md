# What To Build Next

**Status:** Backlog — captured 14 September 2026. Not started. No commitment to a direction yet.

This file exists so the thinking is not lost. It is not a plan.

---

## The goal

A repeatable way to produce projects **where each one costs less than the last**.

Not "AI that behaves well" — AI that gets to a finished thing faster, the same way every time, across work as varied as websites, data-rich applications, project management tools and blockchain scrapers.

The framework must stay a **delivery rail, not a restrictive guard**: flexible, traceable, auditable, and able to improve both itself and the approach behind it as more gets built.

## Where this fits

| Part | What it does | Saves | Status |
| --- | --- | --- | --- |
| **1. The loop** | Plan → build → verify → record | Rework, stalling, wrong turns | ✅ `BUILD_STANDARD.md` |
| **2. Reusable starts** | A library of recurring problems already solved | The blank page — start at step 5, not step 0 | Backlog |
| **3. Compounding memory** | Lessons that outlive the project and feed the next | Solving the same problem twice | Backlog |

Part 1 makes a single project run well. Parts 2 and 3 are what make project #7 cheaper than project #1.

**The gap today:** the standard optimises brilliantly *within* one project and has almost nothing that compounds *across* projects. §21 preserves discoveries, §23 keeps a `# Learnings` section, §8 reuses established patterns — but every one of those is scoped to the project it came from. When a repo goes quiet, the learning goes with it.

---

## Part 2 — Reusable Starts

Think **cooking techniques, not recipes**. A recipe makes one dish. Knowing how to reduce a sauce works in a hundred dishes.

- **What** — Short cards, each covering one recurring problem. Not "how to build a website" (too specific), but "how to pull data every day and prove no day was missed".
- **Why** — These projects share almost no code, but they share problems. Re-deriving the same solution is where the time goes.
- **Who** — Written by hand; read by the planner when building a master plan table.
- **When** — At planning time. Pull the two or three that apply; ignore the rest.
- **Where** — A `patterns/` folder, shipped inside the skill so every machine has it.
- **How** — Each card answers four things: when it applies, what steps it adds to the plan, how to verify it worked, what usually goes wrong.

## Part 3 — Compounding Memory

- **What** — A five-minute step at the end of every project: *what did we learn that will still be true next time?*
- **Why** — Without it, Part 2 is a library nobody adds books to.
- **Who** — Done while the project is still fresh, at completion.
- **When** — At §25, where the standard already declares the build complete.
- **Where** — Straight into `patterns/`, as a new card or an edit to an existing one.
- **How** — Three valid outcomes: write a new card, improve an existing card, or decide nothing is worth keeping.

**Together:** Part 2 without Part 3 goes stale. Part 3 without Part 2 has nowhere to put anything.

---

## Why not project templates

A website scaffold is useless for a blockchain scraper. Across a wide range, any template library either stays too generic to help, or accumulates project-type-specific templates that quietly push new work toward the shapes that already exist. That is the restrictive guard to avoid.

The stacks share nothing. **The concerns overlap heavily:**

| Concern | Website | Data-rich app | PM tool | Scraper |
| --- | --- | --- | --- | --- |
| Daily ingestion that never silently misses a day | | ● | | ● |
| Reconciliation — proving today's data is complete | | ● | | ● |
| Scheduled work that is safe to re-run | | ● | ● | ● |
| Schema change against live data | ● | ● | ● | ● |
| Auth and access model | ● | ● | ● | |
| Deploy and rollback | ● | ● | ● | ● |

A data-rich application and a blockchain scraper are close to the same problem in different clothes: pull from an unreliable source on a schedule, prove nothing was lost, make it re-runnable, alert on gaps.

**So the reusable unit is the concern, not the project type.** Concerns do not care what is being built, which is what keeps the framework project-agnostic.

---

## Decisions already made

**One repo, not two — for now.** Patterns are fragments of a master plan table written in this standard's vocabulary; they mean nothing on their own. One repo means one clone, one sync job, one install. Splitting later is cheap (`git filter-repo` keeps history); merging later is not.

**Split only on evidence.** Revisit if patterns need versioning independent of the standard, if someone wants one without the other, or if public/private access rules diverge. Size alone is not a reason.

**Draw the boundary by audience, not topic.**

| | Where | Why |
| --- | --- | --- |
| The standard | this repo, public | Adoptable by anyone |
| Patterns — generic, de-identified | this repo, public | Publishable, better for being reviewed |
| Project records, war stories, raw learnings | a private repo, when needed | Nobody else's business |

The harvest step is what moves knowledge across that line: a private failure becomes a public pattern once the specifics are stripped. Generalising is what makes it reusable anyway.

**Version stamping.** Every plan should record which version of the standard and which patterns it used — that is the traceability and auditability, and it lets the framework evolve without invalidating finished work.

---

## Proposed shape when this starts

```
unified-build-standard/
├── BUILD_STANDARD.md          # the engine (stable, rarely changes)
├── NEXT_STEPS.md              # this file
├── patterns/                  # the library (grows constantly)
│   ├── README.md              # how to write and use a pattern card
│   └── daily-ingestion-with-reconciliation.md
└── skill/…/references/        # patterns ship here, loaded on demand
```

Skills read references on demand, so fifty patterns do not make any individual project heavier.

---

## Open questions

- What exactly is on a pattern card? Fixed headings, or loose?
- Does the harvest belong inside §25, or as a separate section of the standard?
- Which patterns come first? Candidates: daily ingestion with reconciliation, idempotent scheduled job, schema change on live data.
- Is a private learnings repo needed yet, or is de-identifying at harvest time enough?
- How are patterns referenced from a master plan table — by name in a column, or listed in the plan metadata?

## Suggested first step

**Harvest this project.** Publishing a canonical document as a skill across platforms — canonical source, packaging, install, verification, auto-sync — is itself a repeatable shape that was never captured.

Extract two or three draft pattern cards from it and test them against a genuinely different project. If they would have saved time, the loop is validated and the library has its first entries. If they are too thin or too specific, that is learned cheaply, before committing to a format.
