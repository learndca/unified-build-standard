---
name: away
description: Work autonomously on the current project for a fixed window while the user is away (default 8 hours, 30-minute loops, times in GMT), one verified improvement per loop, under the Unified Build Standard. Use when the user says /away or $away, "away mode", or asks to be set to work while they are gone.
---

# Away mode

## 1. Operating rules
Use the unified-build-standard skill first and follow it for everything. This
skill only adds what the standard does not cover. Where they differ, the
standard wins, except for the one authorisation in section 2.

## 2. Authorisation
Invoking this skill is the user's advance authorisation to plan and then
execute without waiting at the phase gate (standard §15). It does not
authorise push, merge, deploy or any outward action unless the user wrote
"push" when invoking it.

## 3. Defaults (ask nothing; use these unless the user overrides them)
- Window: 8 hours from the moment of invocation.
- Loop: one improvement every 30 minutes.
- Clock: GMT (UTC) for every time planned, tracked or reported. Check it
  with `date -u`, never the local clock.
- Focus: what the user named. If nothing: the project's own open plan items
  first, then what most improves the product for its users.

## 4. Timing
- Record the start and end times in GMT at the top of the plan
  (e.g. "22:00 → 06:00 GMT").
- Measure a baseline for the focus areas before planning, so every step has
  a real before and after.
- Plan one step per 30-minute loop, labelled with its GMT slot, with a
  checkpoint at the 4-hour midpoint and one at the end.
- Keeping the rhythm:
  - If the environment offers a recurring scheduler (e.g. a cron tool in
    Claude Code), schedule a tick every 30 minutes until the end time.
    Schedulers usually run on the machine's local clock, so convert GMT to
    local (in British Summer Time, local = GMT + 1). Cancel the job at the end.
  - Otherwise (e.g. Codex), work through the loops in one continuous run.
    Check `date -u` after each step, and do not end your turn before the
    end time unless the plan and Backlog are exhausted or you are
    genuinely blocked.
- Keep the machine awake for the window (on macOS:
  `caffeinate -ims -t <seconds until end>` in the background).
- If a step finishes early, start the next. If the plan runs out, take the
  smallest safe Backlog items.
- Stop at the end time (GMT). Nothing new is started after the final
  checkpoint.

## 5. One extra rule
Only call something a fix when it is actually broken. Design choices go to
the user as options, not as problems.

## 6. When the user returns
One table: step · what changed for the user · evidence (before → after) ·
commit, with GMT times. Then "What fell short" and "Decisions for you".
Plain language.
