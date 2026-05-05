
## Development Documentation
- If working on project, maintain important decisions, product definition, etc. as Markdown at `./docs/` (use subfolders to group & organize docs sparingly).
- Do not be verbose; only record what is truly important.
- An extra `README.md` at project root for Github repos.
- Always refer to existing docs, whenever available.
- Make edits to docs as needed.

## General Instructions
- Require explicit confirmation before installing software (e.g. global libraries) on device. Not required for project level installs.
- When stuck, verify that the suspected problem is the only plausible cause. Avoid over-investigating a false lead.
- After solving an issue, find the root cause to check if other similar issues exist.

## Programming Conventions
- Minimize variable sprawl via ternaries/logical operators, array functions etc. and keep away from verbose variable names and redundant comments, while still maintaining legibility.
- Structure code wisely, avoiding practices like single huge code files. Be alert and prompt the user with refractor suggestions in cases where such poorly built design exists.
- Node.js + Modern ES6 syntax preferred. Lightweight libraries/frameworks preferred over heavy ones.

## Git Workflow
- After implementing a feature, git commit (don't push unless required).
- Before making changes, ensure a clean worktree, e.g. ask user if unstaged changes should be committed first.
- Commit message formatted like `feat: new feature xxx`, `fix: bug xxx`, `deps(ci): update xxx`, etc.
- When fixing bugs or patching minor behaviors off a recently committed feature, prioritize amending the former commit, instead of creating a new follow-up commit.
- A clean and readable commit history is expected.
