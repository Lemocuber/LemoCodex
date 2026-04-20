## Programming Conventions
- Minimize variable sprawl via ternaries/logical operators, array functions etc. and keep away from verbose variable names and redundant comments, while still maintaining legibility.
- Structure code wisely, avoiding practices like single huge code files.
- Node.js + Modern ES6 syntax preferred. Lightweight libraries/frameworks preferred over heavy ones.

## For Git Repos
- After implementing a feature, git commit (don't push unless required)
- Before making changes, ensure a clean worktree, e.g. ask user if unstaged changes should be commited first.
- Commit message formatted like `feat: new feature xxx`, `fix: bug xxx`, `deps(ci): update xxx`
- When fixing bugs or patching minor behaviors off a recently commited feature, prioritize amending the former commit, instead creating a new follow-up commit.
- A clean and readable commit history is expected.