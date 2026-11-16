#!/bin/sh
# Create a build-plan/ folder in a project from the standard templates,
# and point AGENTS.md and CLAUDE.md at it.
#
# Usage: new-build-plan.sh [project folder]     (default: current folder)
#
# Safe to run twice: it never overwrites an existing build-plan/ and never
# adds the pointer line a second time.

set -eu

project="${1:-.}"
script_dir="$(cd "$(dirname "$0")" && pwd)"
templates="$script_dir/../templates/build-plan"
target="$project/build-plan"
pointer='Build work in this project is tracked in `build-plan/`. Read `build-plan/README.md` before building.'

if [ ! -d "$project" ]; then
  echo "Not a folder: $project" >&2
  exit 1
fi

if [ ! -d "$templates" ]; then
  echo "Templates not found at $templates" >&2
  exit 1
fi

if [ -e "$target" ]; then
  echo "build-plan/ already exists in $project. Nothing was changed."
  echo "To start a new build, move its contents to build-plan/archive/<date>-<name>/ first."
  exit 2
fi

mkdir -p "$target/steps"
cp "$templates/README.md" "$templates/GOAL.md" "$templates/PLAN.md" "$templates/LOG.md" "$target/"
cp "$templates/steps/STEP_TEMPLATE.md" "$target/steps/"
echo "Created $target"

for name in AGENTS.md CLAUDE.md; do
  file="$project/$name"
  if [ -f "$file" ] && grep -qF 'build-plan/README.md' "$file"; then
    echo "$name already points at build-plan/"
  else
    if [ -s "$file" ]; then
      printf '\n%s\n' "$pointer" >> "$file"
    else
      printf '%s\n' "$pointer" > "$file"
    fi
    echo "Added pointer to $name"
  fi
done
