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
| **3. Compounding memory** | Lessons that outlive the project and feed the next | Solving the same problem twice | Backlog — **highest interest** |
| **4. The delivery rail** | Publishing a capability as a skill callable from any platform or device | Knowledge stranded on one machine | Working example exists; not captured as a pattern |

Part 1 makes a single project run well. Parts 2 and 3 are what make project #7 cheaper than project #1.

> ## Priority
>
> **Part 3 — compounding memory — is the part of most interest, and the part to get right first.**
>
> Part 2 is the more obvious time-saver, but a pattern library is only ever as good as what
> gets deposited into it. The mechanism that captures a lesson while it is still fresh, and
> makes it available to the next project, is the thing worth solving. Without it there is
> nothing to build a library out of.
>
> Recorded 14 September 2026 as the owner's stated priority.

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

**This is the priority. Everything else in this file is downstream of it.**

- **What** — A five-minute step at the end of every project: *what did we learn that will still be true next time?*
- **Why** — Without it, Part 2 is a library nobody adds books to.
- **Who** — Done while the project is still fresh, at completion.
- **When** — At §25, where the standard already declares the build complete.
- **Where** — Straight into `patterns/`, as a new card or an edit to an existing one.
- **How** — Three valid outcomes: write a new card, improve an existing card, or decide nothing is worth keeping.

**Together:** Part 2 without Part 3 goes stale — a library nobody ever adds to.

**But Part 3 does not have to wait for Part 2.** Harvested lessons can land in a single
flat file long before there is any structured library. The library is arguably better grown
that way: let the pattern cards emerge from what actually accumulates, rather than designing
a card format in the abstract and hoping real lessons happen to fit it.

That inverts the obvious order — and it means the priority can be started immediately,
with one file and one habit, without committing to any of Part 2's design.

---

## Part 4 — The Delivery Rail

*Publish a capability as a cross-platform skill.*

**Why this is not just another pattern.** Parts 2 and 3 produce knowledge. Knowledge sitting
in a folder on one machine is a private notebook. This is what ships it — to every device,
every AI, callable by name, staying current on its own.

The sequence is: **Part 3 produces it → Part 2 organises it → Part 4 delivers it.**

This repository is already a working instance of the pattern. Nothing here needs inventing;
it needs capturing.

### The seven steps

| Step | What it does | Working example |
| --- | --- | --- |
| 1. Canonical source | One file is truth; every other copy is derived | `BUILD_STANDARD.md` |
| 2. Skill wrapper | `SKILL.md` — the `description` is what makes it findable | `skill/unified-build-standard/` |
| 3. Package per platform | Anthropic ZIP, OpenAI plugin manifest | `scripts/package_skill.py` |
| 4. Install by symlink | One `git pull` updates every local install at once | `~/.claude/skills`, `~/.agents/skills` |
| 5. Auto-sync | Scheduled fast-forward pull with three safety rules | launchd on macOS, systemd on Linux |
| 6. Verify | Drift, frontmatter, manifest, ZIP structure, secrets, live URL | `package_skill.py --check` |
| 7. Document install paths | Per-platform instructions | `anthropic/README.md`, `openai/README.md` |

### What varies, and what does not

Only four things change between uses:

- the document or capability being published
- the skill's name and description
- which platforms are wanted
- public or private

**Everything else is identical.** That reuse ratio is what makes this worth templating —
and it is why the seven steps above are worth writing down before the details fade.

### Three levels of ambition

| Level | What it is | Effort |
| --- | --- | --- |
| **1. A pattern card** | Written steps plus pointers to the working examples above | ~1 hour |
| **2. A template repo** | "Use this template" → rename → drop the document in → run the script | ~half a day |
| **3. A skill that publishes skills** | `/publish-skill` — creates the repo, packages, installs, syncs, verifies | ~a day |

**Recommendation: Level 1 now; Level 2 or 3 only after doing this a second time.**

What to parameterise is learned by doing something twice. Building a generator at n=1 risks
templating the accidents of this particular project — things that happen to be true for a
511-line Markdown document and may not hold for whatever gets published next. §8 of the
standard applies: evidence over assumptions, and no speculative scope.

### Known limitation — write this on the card

"Callable from any platform and device" carries an asterisk, and it should be recorded up
front rather than rediscovered later:

- **Machines** — fully automatic. Clone, symlink, sync. Change the source and every local
  install follows.
- **Web and phone** — manual. There is no API for uploading a skill to a Claude or ChatGPT
  account; it is a browser upload. Change the source and the ZIP must be re-uploaded by hand.

So the failure mode to design against is: **three installs update themselves, two do not, and
the two that do not will quietly run an old version until someone remembers.** A `publish`
command that repackages and then reminds about the two manual uploads would remove most of
that risk without pretending the uploads can be automated.

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

Start with Part 3, since that is the priority — and start it small.

**1. Create one file and one habit.** A single `LEARNINGS.md` and a rule: at the end of
every project, spend five minutes writing down what will still be true next time. Nothing
more structured than that yet. No card format, no library, no schema to design.

**2. Harvest this project as the first entry.** The shape it followed is written up as
[Part 4 — The Delivery Rail](#part-4--the-delivery-rail) above. That harvest and Part 4's
Level 1 are the same hour of work: a real, finished project sitting right there, which makes
it a free first test of whether the habit produces anything useful.

**3. Let the structure emerge.** After three or four harvests, look at what accumulated.
The repeated shapes in that file are the first pattern cards, and their real headings will
be obvious from the entries rather than guessed at in advance. That is when Part 2 starts,
and it starts with evidence.

The open questions below about card format and referencing do not need answering to begin.
They answer themselves once there is something to look at.
