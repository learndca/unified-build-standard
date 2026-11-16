# Goal

| | |
| --- | --- |
| **Project** | [project and build name] |
| **Goal** | [the outcome, in one sentence] |
| **Measure** | [exact command or check, and how to read the result] |
| **Baseline** | [result today] on [date] |
| **Target** | [the result that means done] |
| **Protected** | The measure and the acceptance checks below. Existing tests. [anything else that must not change] |
| **Run mode** | [Gated: report and stop after each phase] or [Unattended: run until a stop condition, then report once] |
| **Stop when** | Target met · [40] loops · [5] loops in a row with no gain · [time limit, if any] · an action that needs approval |
| **Allowed without asking** | [for example: commit to branch `build/<name>`] |
| **Not allowed** | [for example: push, deploy, spend, changes to the live database] |
| **Final check** | [Yes: a fresh reviewer compares the result with this goal] or [No] |
| **Starting point** | Branch [name] at commit [id]. [note any uncommitted work that belongs to the owner] |
| **Planned by** | [model or person], [date] |
| **Go given** | [date, and the owner's words] |

## Acceptance checks

Use this section when the goal is a feature rather than a number. Each check is something a person can see pass or fail. The planner writes them; nobody edits them during the build without the owner's approval.

| # | Check | How to test it | Passes? |
| --- | --- | --- | --- |
| A1 | [observable behaviour] | [steps or command] | No |
| A2 | | | No |

Score: 0 of [total] passing.
