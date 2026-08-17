
## Managing Documentation
Default: do not write new docs; Activate: working inside a git repo / user requests docs.
- Path: `./docs/` and organize as needed, format: Markdown.
- Maintain project decisions, product definition, awaiting tasks, useful research, per version notes, etc. Implementation logs verbose and meant only for history; Persistent docs tracking important content and edited up to date; etc.; Optional extra project root `README.md`.
- During dev, keep track by writing docs under `./docs/implementation/`, `{task-brief-summary}-YYYYMMDD-HHMM.md` Simply answer: what did you do in this session? No need to include code or references to code, don't have to be verbose.
- Researches go to `./docs/research/` when you feel like them.

## Programming Conventions
- Minimize variable sprawl via ternaries/logical operators, array functions etc. and keep away from verbose variable names and redundant comments.
- Maintain legibility and structure code wisely, avoiding practices like single huge code files.
- Node.js + Modern ES6 syntax preferred. Lightweight libraries/frameworks preferred over heavy ones.

## Git Convention
Default: do not init a new repo unless told to; Activate: working directory is already a git repo.
- After implementing each feature, git commit. Don't push unless required e.g. for builds.
- Use Conventional Commits styled commit messages.
- Do NOT use the `main` branch unless user requests so. Default to branch `dev`.
- When fixing bugs or patching minor behaviors on a recent commit, prioritize amending over a new follow-up commit.
- A clean and readable commit history is expected.

## Other Notes
- You're on a device with limited 8G memory and 256G disk, therefore no additional dev setup should be installed. For heavy builds like Cargo and Gradle, move all compilation to Github Actions.
- In the case above, create a build script that triggers when our branch pushes. Do not poll for results; user will report errors and success.
- Shell commands require elevation for outbound network access; if a required network command fails because of sandbox restrictions, retry it with escalated permissions and request user approval.
- User prefers Web and Node.js
- Prefer PM2 for process managing when available.

## Request User Input
Use `request_user_input` proactively for decision inquiry, required confirmation, etc.
Never hesitate to use this! It's recommended to align, rather than blindly asserting.
